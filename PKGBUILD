# Maintainer: Ben Morgan <neembi@gmail.com>
pkgname=fairsplit
pkgver=1.1
pkgrel=3
pkgdesc="A simple program to calculate how to split multiple expenses fairly."
arch=('i686' 'x86_64')
url="https://github.com/cassava/fairsplit"
license=('MIT')
makedepends=('git' 'go')
options=('!strip')
source=("git+https://github.com/cassava/fairsplit.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
    source /etc/profile.d/go.sh
    export GOPATH="$srcdir"
    cd "$srcdir/$pkgname"
    go build -o "$pkgname"
}

package() {
    cd "$srcdir/$pkgname"
    install -m755 -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -m644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
