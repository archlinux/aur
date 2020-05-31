# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Alan D'souza <hello@xilog.xyz>
pkgname=go-clock
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="go-clock command line utility to make a large clock using Unicode characters"
arch=("x86_64")
url="https://github.com/XilogOfficial/go-clock/raw/master/"
license=('MIT')
groups=()
depends=()
makedepends=(go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('5b8c3b6479e6753d9e9b2731da527210')
validpgpkeys=()

prepare(){
    cd "$srcdir"
    mkdir -p build
}

build(){
    go build -o build/$pkgname .
}

check() {
    go test .
}

package() {
    sudo install -Dm755 build/$pkgname /usr/bin/$pkgname
}

md5sums=('97f6383ffcd74aed66b231bb65f69b59')
