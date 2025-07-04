# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-idl
pkgver=6.0.4
pkgrel=1
groups=("tango-controls")
pkgdesc="This is the Tango CORBA IDL file."
arch=("any")
url="https://gitlab.com/tango-controls/tango-idl"
license=("GPL-3.0-or-later")
makedepends=("cmake>=3.7")
conflicts=("tango-idl-git")
source=("https://gitlab.com/tango-controls/tango-idl/-/archive/${pkgver}/tango-idl-${pkgver}.tar.gz")
sha256sums=('0e6df8ebbfb21ee218d71d55d7e3ac6128ad07d55e8e1f60a611a8088f05b12d')


build() {
  cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
