# Maintainer Adrià Arrufat <swiftscythe@gmail.com>
# Contributor yochananmarqos

pkgname=powerline-go
pkgver=1.22.0
pkgrel=1
pkgdesc="A beautiful, useful and fast prompt for your shell"
arch=('x86_64')
url="https://github.com/justjanne/powerline-go"
license=('GPL3')
makedepends=('go-pie' 'git')
optdepends=('powerline-fonts')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d32d35922eae0125eba71e146336e1144e293443ecadfef53c46d6a09e51ae7e')

build() {
    export GOPATH="${srcdir}/gopath"
    cd "$pkgname-$pkgver"
    go build \
    -trimpath \
    -modcacherw \
    -ldflags "-extldflags ${LDFLAGS}" \
    .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
