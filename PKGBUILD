pkgname=qt6pas
_lazarus_tag=3_0
pkgver=6.2.7
pkgrel=2
pkgdesc='Free Pascal Qt 6 binding library updated by lazarus IDE'
arch=('x86_64')
url='https://gitlab.com/freepascal.org/lazarus/lazarus/-/tree/main/lcl/interfaces/qt6/cbindings'
license=('LGPL3')
depends=('qt6-base')
options=(libtool staticlibs)
source=("https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${_lazarus_tag}/lazarus-lazarus_${_lazarus_tag}.tar.bz2")
sha512sums=('131cc6ffc31fdc98a8ae3a9edd75d2e1d4e5cf1b963a5849c3e42aafea9ea1ae78ba0eaffd38c4ea6848cc58a024ebd878ae1771f2af65de7355f43a1b9b766c')

build() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt6/cbindings"
    qmake6
    make
}

package() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt6/cbindings"
    make INSTALL_ROOT="$pkgdir" install
}
