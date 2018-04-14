# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
pkgname=realyog
pkgver=1.1
pkgrel=1
pkgdesc="Wrapper around yay to make things simple."
arch=(x86_64)
url="https://github.com/Myl0g/realyog"
license=('GPL')
depends=(
    'yay'
)
makedepends=(
    'git'
    'go'
    'golang-dep'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Myl0g/realyog.git#tag=v${pkgver}")
noextract=()

prepare() {
    export GOPATH="$srcdir/go"
    cd $srcdir
    mkdir -p go/src/github.com/Myl0g
    mv "${pkgname%-git}" "$_/"
}

package() {
	cd "$srcdir/go/src/github.com/Myl0g/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
md5sums=('SKIP')
