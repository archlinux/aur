# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-idl
pkgver=6.0.2
pkgrel=1
groups=('tango-controls')
pkgdesc="This is the Tango CORBA IDL file."
arch=('x86_64' 'armv7h')
url="https://www.tango-controls.org/"
license=('GPL3')
depends=('cmake>=3.7')
conflicts=('tango-idl-git')
source=("https://gitlab.com/tango-controls/tango-idl/-/archive/${pkgver}/tango-idl-${pkgver}.tar.gz")
sha256sums=('490ca710957b69fa412e04534ec06f8f1925dbe681df520469637ba12e15737a')
_dir="${pkgname}-${pkgver}"


build() {
  cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
