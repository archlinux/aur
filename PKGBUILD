# Maintainer: dryes <joswiseman@cock.li>
pkgname='clnns-git'
pkgver=9
pkgrel=1
pkgdesc='searches and downloads from newznab providers on the command line.'
url='https://github.com/d2yes/clnns'
arch=('any')
license=('MIT')
depends=('python' 'python-feedparser')
makedepends=('git')
source=('git://github.com/d2yes/clnns.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo $(git rev-list --count master)
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 "${srcdir}/clnns/clnns.py" "${pkgdir}/usr/bin/clnns"
}
