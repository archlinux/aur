# Maintainer: Attenuation <ouyangjun1999@gmail.com>

pkgname=indole
pkgver=0.5
pkgrel=1
pkgdesc="INDOLE is an open framework for data transfer with fully customized protocol by end user."
arch=('x86_64')
url="https://github.com/c8h7n/indole"
license=('GPL-3.0')
makedepends=('go')
source=("https://github.com/c8h7n/indole/archive/v$pkgver.tar.gz")
sha256sums=('a513b300c88507718f5d351988d6603c5bf63ecd6ade756153341e71f55e1c29')

build() {
    cd "$pkgname-$pkgver"
    env GOPATH=$(pwd) go build indole
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}