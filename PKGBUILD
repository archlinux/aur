# Maintainer Adrià Arrufat <swiftscythe@gmail.com>
# Contributor yochananmarqos

pkgname=powerline-go
pkgver=1.25
pkgrel=1
pkgdesc="A beautiful, useful and fast prompt for your shell"
arch=('x86_64')
url="https://github.com/justjanne/powerline-go"
license=('GPL3')
makedepends=('go-pie' 'git')
optdepends=('powerline-fonts')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('64cb194bbf08536320d0f4c24ef9524fdf486f579147cacdb0b6dc0afc1134e2')

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
