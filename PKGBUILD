# Maintainer: Michael Orishich <mishaor2005@ukr.net>
pkgname=ls_extended
pkgver=1.0.0
pkgrel=2
epoch=
pkgdesc='ls with coloring and icons'
arch=('x86_64')
url="https://github.com/Electrux/ls_extended"
license=('BSD')
groups=()
makedepends=('ccp4m')
optdepends=('nerd-fonts-complete: for icon support')
depends=('glibc' 'ttf-nerd-fonts-symbols')
provides=('ls')
backup=()
options=()
install=
changelog=
source=("https://github.com/Electrux/$pkgname/archive/master.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
    cd "$pkgname-master"
    ccp4m project build
    ccp4m project test
}

package() {
    cd "$pkgname-master"
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/ls_extended/license.txt
    install -D bin/ls_extended $pkgdir/usr/bin/ls_extended
}
