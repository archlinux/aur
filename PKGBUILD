# Maintainer Adrià Arrufat <swiftscythe@gmail.com>
# Contributor yochananmarqos

pkgname=powerline-go
pkgver=1.21.0
pkgrel=1
pkgdesc="A beautiful, useful and fast prompt for your shell"
arch=('x86_64')
url="https://github.com/justjanne/powerline-go"
license=('GPL3')
makedepends=('go-pie' 'git')
optdepends=('powerline-fonts')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eee6ef47676e42eccca3b7098a8b71c0854f7419f1bce13c72747217ce0661a3')

build() {
    export GOPATH="${srcdir}/gopath"
    cd "$pkgname-$pkgver"
    go build \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS}" \
    .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
