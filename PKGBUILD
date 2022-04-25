# Maintainer Adrià Arrufat <swiftscythe@gmail.com>
# Contributor yochananmarqos

pkgname=powerline-go
pkgver=1.22.1
pkgrel=1
pkgdesc="A beautiful, useful and fast prompt for your shell"
arch=('x86_64')
url="https://github.com/justjanne/powerline-go"
license=('GPL3')
makedepends=('go-pie' 'git')
optdepends=('powerline-fonts')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f47f31c864bd0389088bb739ecbf7c104b4580f8d4f9143282b7c4158dc53c96')

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
