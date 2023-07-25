pkgname=qt6pas
_lazarus_tag=3_0_RC2
pkgver=6.2.7
pkgrel=1
pkgdesc='Free Pascal Qt 6 binding library updated by lazarus IDE'
arch=('x86_64')
url='https://gitlab.com/freepascal.org/lazarus/lazarus/-/tree/main/lcl/interfaces/qt6/cbindings'
license=('LGPL3')
depends=('qt6-base')
options=(libtool staticlibs)
source=("https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${_lazarus_tag}/lazarus-lazarus_${_lazarus_tag}.tar.bz2")
sha512sums=('1e91e561ea44876357b1fa71e6a0c0385a382b9d00a219a06e46fcc043c6968cf1beef1dcdc65440bd12c3982f770c9c0d21b4f063df36ddddff80a43591d1a0')

build() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt6/cbindings"
    qmake6
    make
}

package() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt6/cbindings"
    make INSTALL_ROOT="$pkgdir" install
}
