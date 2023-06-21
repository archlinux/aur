# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi
pkgver=2.7.0
pkgrel=1
epoch=
pkgdesc="A minimalist, self-hosted WakaTime-compatible backend for coding statistics"
arch=("any")
url="https://github.com/muety/wakapi"
license=('GPL-3.0')
groups=()
depends=()
makedepends=(
    go
)
checkdepends=()
optdepends=()
provides=("wakapi")
conflicts=("wakapi-bin")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/muety/wakapi/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('ff70da1ad8690270434ea242b639cf0462f9e297dc49cbe2c77d26511a58b15ff251e008b87aea3db092841ab6c7e6a3784365fbac5351a38dab78337330c5c1')
noextract=()
validpgpkeys=()

build() {
    cd "wakapi-$pkgver"
    go build -o wakapi -v
}

check() {
    cd "wakapi-$pkgver"
    go test -v
}

package() {
    cd "wakapi-$pkgver"
    install -Dm755 "wakapi" "$pkgdir/usr/bin/wakapi"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/wakapi/LICENSE"
    install -Dm644 "config.default.yml" "$pkgdir/etc/wakapi/config.yml"
}
