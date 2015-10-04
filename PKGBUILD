# Maintainer: Josh Hebert <aksr at t-com dot me>
pkgname=msi-keyboard-git
pkgver=r12.cca8ccf
pkgrel=1
epoch=
pkgdesc="Utility to control MSI Steelseries keyboards, written in C++"
arch=('i686' 'x86_64')
url="https://github.com/bparker06/msi-keyboard"
license=('BSD')
groups=()
depends=('')
makedepends=('git' 'unzip' 'hidapi' 'libusb' 'qt5-base')
optdepends=()
checkdepends=()
provides=('msi-keyboard')
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/bparker06/msi-keyboard")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    qmake
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 msi-keyboard "$pkgdir/usr/bin/msi-keyboard"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
