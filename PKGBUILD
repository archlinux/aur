# Maintainer: dryes <joswiseman@cock.li>
pkgname='nzbsubs-git'
pkgver=16
pkgrel=1
pkgdesc='takes an nzb input and removes all non-subtitle files.'
url='https://github.com/d2yes/nzbsubs'
arch=('any')
license=('MIT')
depends=('python2' 'python2-pynzb')
makedepends=('git')
source=('git://github.com/d2yes/nzbsubs.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo $(git rev-list --count master)
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 "${srcdir}/nzbsubs/nzbsubs.py" "${pkgdir}/usr/bin/nzbsubs"
}
