# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi
pkgver=2.0.1
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
sha256sums=("cbbd66ca5139187c2399728387a2018457eb21bdfe8af66442ae80123877224d")
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
