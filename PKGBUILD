# Maintainer: Gordon Schulz <gordon.schulz@gmail.com>
pkgname=go-envtpl
_pkgname=envtpl
pkgver=1.0.0
pkgrel=2
pkgdesc='envtpl renders Go templates on the command line using environment variables'
arch=('x86_64')
url="https://github.com/subfuzion/envtpl"
license=('MIT')
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('1ee5568fd30f8eafa88772b98f6ffe590cf4d7fb68b38ce212b103a27c5b7485')

build() {
    cd $_pkgname-$pkgver
    go build \
        -trimpath \
        -ldflags "-extldflags $LDFLAGS" \
        -o $_pkgname \
        ./cmd/envtpl/.

}

package() {
    cd $_pkgname-$pkgver
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
