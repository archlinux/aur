# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=vym-devel
pkgver=2.9.0
pkgrel=1
pkgdesc="A mindmapping tool"
arch=('i686' 'x86_64')
url="https://www.insilmaril.de/vym/"
license=('GPL')
depends=('cmake' 'zip' 'unzip' 'qt5-svg' 'qt5-script' 'desktop-file-utils' 'hicolor-icon-theme' 'ruby')
makedepends=('qt5-tools')
install=$pkgname.install
source=("https://github.com/insilmaril/vym/archive/refs/tags/v${pkgver}.tar.gz"
        vym.desktop)
sha256sums=('72451681a3a4e1494f25c1ff9d4110c138095d63ed4d1471c76ed907606a7cdb'
            'e299c69c213e7aac3f5b5d0ab088132b4ec7cb63a391f272e75ed64f049d541b')

build() {
  cd "${srcdir}"/vym-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr/ .
  make
}

package() {
  cd "${srcdir}"/vym-${pkgver}

# install files
  make INSTALL_ROOT="${pkgdir}" DESTDIR=${pkgdir} install

}
