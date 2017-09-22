# Maintainer: Nhoya <nhoyadx@gmail.com>
pkgname="multibase"
pkgver=1.0
pkgrel=1
pkgdesc="Multi-base encoding/decoding utility. Allow encoding and decoding in base32, base58, base64, base64URL, base85 of file and strings"
arch=('any')
url="https://github.com/Nhoya/multibase"
license=('GPLv3')
groups=()
depends=("go")
checkdepends=("go")
changelog=
source=("https://github.com/Nhoya/multibase/archive/1.0.tar.gz")
sha256sums=("1f916790b28ffb698d7dfde572f62e6f2306e35064ee07c50fc0a96f30270f18")

validpgpkeys=()

build() {
        cd "$pkgname-$pkgver"
        echo "Installing dependencies"
        go get -v "github.com/jbenet/go-base58"
        go get -v "github.com/jessevdk/go-flags"
        echo "Building package"
        go build
}

package() {
        cd "$pkgname-$pkgver"
        echo "Moving package to /usr/local/bin"
        install -Dm 755 multibase-$pkgver $pkgdir/usr/bin/mb
        echo "Done"
}

