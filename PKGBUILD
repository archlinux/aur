# Maintainer: Amin Vakil <info AT aminvakil DOT com>
pkgname=bandcamp-api
pkgver=r53.19c8283
pkgrel=1
pkgdesc="A simple way to get info from Bandcamp"
arch=('any')
url="https://github.com/RustyRin/bandcamp-api/"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools' 'git')
source=($pkgname::git+$url)
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install -O1 --root="${pkgdir}"
}
