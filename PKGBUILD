# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Alfred Roos alfred@stensatter.se
pkgname=linecounter-git
pkgver=2.2.7
pkgrel=1
epoch=
pkgdesc="This is a program that can count all lines in your source code. Run lctr to count all lines. Run lctr -h for help!"
arch=(x86_64)
url="https://gitlab.com/spynets1/Linecounter.git"
license=('MIT')
groups=()
depends=(python-flagser)
makedepends=(git python python-pip)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
    git clone https://gitlab.com/spynets1/Linecounter.git lctr
}

package() {
    cd lctr
    install -Dm644 ./src/fileReader.py "$pkgdir/usr/bin/fileReader.py"
    install -Dm644 ./src/printer.py "$pkgdir/usr/bin/printer.py"
    install -Dm755 ./src/main.py "$pkgdir/usr/bin/lctr"
}
