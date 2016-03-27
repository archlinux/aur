# Maintainer: dryes <joswiseman@cock.li>
pkgname='catdy-git'
pkgver=1
pkgrel=1
pkgdesc='for determining categories of given scene directories or dirnames.'
url='https://github.com/dryes/catdy'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git')
source=('git://github.com/dryes/catdy.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo $(git rev-list --count master)
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 "${srcdir}/catdy/catdy.py" "${pkgdir}/usr/bin/catdy"
}
