# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi
pkgver=2.2.4
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
b2sums=("ad911577dfb8624da1933be5ffbf2c3d0bff6a4268926194c6bb372b582dd4c523041937ebbf9fd2ddb7e97564f27ff5b2e1deba7d4fc335b984d32ade896233")
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
