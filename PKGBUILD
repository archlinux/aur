# Maintainer Adrià Arrufat <swiftscythe@gmail.com>
# Contributor yochananmarqos

pkgname=powerline-go
pkgver=1.24
pkgrel=1
pkgdesc="A beautiful, useful and fast prompt for your shell"
arch=('x86_64')
url="https://github.com/justjanne/powerline-go"
license=('GPL3')
makedepends=('go-pie' 'git')
optdepends=('powerline-fonts')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('08d958c49269e7025a998a617f3d6a0b6dcd7432437f950f0d0e3335bf7b59b3')

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
