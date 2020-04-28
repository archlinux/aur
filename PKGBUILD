# Maintainer Adrià Arrufat <swiftscythe@gmail.com>
# Contributor yochananmarqos 

pkgname=powerline-go
pkgver=1.17.0
pkgrel=1
pkgdesc="A beautiful, useful and fast prompt for your shell"
arch=('x86_64')
url="https://github.com/justjanne/powerline-go"
license=('GPL3')
makedepends=('go-pie' 'git')
optdepends=('powerline-fonts')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d7825168044159dfdd3983519ea26cf8753f24c3d8c0600ce494c4a6db7a015f')

build() {
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
