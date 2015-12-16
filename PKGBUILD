pkgname=skypeweb
_parentpkg=skype4pidgin
pkgver=1.0
pkgrel=1
pkgdesc='SkypeWeb Plugin for Pidgin'
arch=('any')
url='https://github.com/EionRobb/skype4pidgin/tree/master/skypeweb'
license=('GPL')
depends=('libpurple' 'json-glib')
makedepends=('git')
source=("https://github.com/EionRobb/${_parentpkg}/archive/v${pkgver}.tar.gz")
sha512sums=('324d1832b3dcb7c7ff3039bd455da8ea0128b30b1778d98bb6fb90ea7b9aaf4f59711c8ed5480f96fd2c75dc7ca1c3033d9b957438289d5815a09881723ff761')

build() {
  cd ${_parentpkg}-${pkgver}/${pkgname}
  make
}

package() {
  cd ${_parentpkg}-${pkgver}/${pkgname}
    make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
