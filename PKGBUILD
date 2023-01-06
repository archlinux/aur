# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Alfred Roos alfred@stensatter.se
pkgname=linecounter-git
pkgver=2.1.5
pkgrel=1
epoch=
pkgdesc="This is a program that can count all lines in your source code. Run lctr to count all lines. Run lctr -h for help!"
arch=(x86_64)
url="https://github.com/spynetS/Linecounter.git"
license=('MIT')
groups=()
depends=()
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
    git clone https://github.com/spynetS/Linecounter.git lctr
}

build() {
    cd lctr
    pip install pyinstaller
    python3 -m PyInstaller --onefile ./src/main.py
}

package() {
    cd lctr
    install -Dm755 ./dist/main "$pkgdir/usr/bin/lctr"
    # export lctr=/user/bin/lctr
}
