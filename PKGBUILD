# Maintainer: Shraga Starbuck7410@gmail.com
pkgname=library-converter-git
pkgver=3.3.0
pkgrel=1
epoch=
pkgdesc="A music library format converter, to make holding archival and compressed copies of music libraries easier."
arch=(x86_64)
url="https://github.com/Starbuck7410/library-converter.git"
license=('GPL')
groups=()
depends=(ffmpeg)
makedepends=(nodejs npm)
checkdepends=()
optdepends=()
provides=(library-converter)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

prepare() {
    cd "$srcdir/library-converter" 
    npm install
	sudo npm install @yao-pkg/pkg
}

build() {
    cd "$srcdir/library-converter"
	pkg main.js --target node22-linux-x64
}

package() {
    cd "$srcdir/library-converter"
	sudo cp main /usr/bin/library-converter
}
