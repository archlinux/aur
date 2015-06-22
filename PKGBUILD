#
# PKGBUILD for qtcbm
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
pkgname=qtcbm
pkgver=1.0.0
pkgrel=2
epoch=
pkgdesc="Qt GUI Frontend for the (Open)CBM utils"
arch=('i686', 'x86_64')
_pkgname=QtCBM
_pkgver=1.0.0
url="https://github.com/mveinot/QtCBM"
license=('GPLv2')
groups=()
#depends=('qt5-base' 'qt-solutions' 'opencbm-git')
depends=('qt5-base' 'opencbm-git')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/mveinot/${_pkgname}/archive/v${_pkgver}.tar.gz"
         "git+https://git.gitorious.org/qt-solutions/qt-solutions.git")
noextract=()
sha512sums=('ee9c057e4f00916a0e2a450c4e4f50177ce76d54dd546786dd59903aa65883013bc811d82290e79e492da9c3c0b34b3eb83b8c377bba8255d53757c58b35e004'
            'SKIP')
md5sums=('d53f8b0c09059604ed698ac6c11ed061'
         'SKIP')
sha1sums=('ff8f24fdf1b2316f65433766c72de58520512d06'
          'SKIP')
sha256sums=('dbeb32a8c51c84c434918a9c31729ea37be2a7b9788d1417bac5cf8d88a49d2a'
            'SKIP')
sha384sums=('eed22d0d693304d867fcaf5df3cf242e15bb17bd45889fe1ed063df22e8f95ffbd91d59ce44965d63900c6efc0a98eb7'
            'SKIP')
sha512sums=('ee9c057e4f00916a0e2a450c4e4f50177ce76d54dd546786dd59903aa65883013bc811d82290e79e492da9c3c0b34b3eb83b8c377bba8255d53757c58b35e004'
            'SKIP')


prepare() {
  cd "$srcdir/${_pkgname}-${_pkgver}"
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  #make -C diskimage -f Makefile.unix
  qmake
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm0755 ${_pkgname} "$pkgdir/usr/local/bin/qtcbm"
}

# EOF
