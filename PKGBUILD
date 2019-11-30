# Maintainer: AdinGreen <poemdistance@gmail.com>

pkgname=mstran
pkgver=version
pkgrel=1.0
epoch=
pkgdesc=""
arch=(x86_64)
url=""
license=('GPL')
groups=()
depends=('gtk3' 'libxtst' 'libx11' 'xdotool' 'python-pip' 'tesseract' 'meson')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/poemdistance/Mstran-pure.git')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
    cd Mstran-pure/
    sudo pip3 install pytesseract tesseract pillow meson
}

build() {
    cd Mstran-pure/src
    bash prepare.sh
    make
}

package() {
    cd $srcdir/Mstran-pure/src
    make install
}
