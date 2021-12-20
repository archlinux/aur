# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi-bin
pkgver=1.30.3
pkgrel=1
epoch=
pkgdesc="A minimalist, self-hosted WakaTime-compatible backend for coding statistics"
arch=("x86_64")
url="https://github.com/muety/wakapi"
license=('GPL-3.0')
groups=()
depends=()
makedepends=(
    unzip
)
checkdepends=()
optdepends=()
provides=("wakapi")
conflicts=("wakapi")
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/muety/wakapi/releases/download/${pkgver}/wakapi_linux_amd64.zip"
    "https://raw.githubusercontent.com/muety/wakapi/master/LICENSE"
)
sha256sums=(
    "6f6d45c7b7e04506d1de808caed34a722d81fad3ad8d65430abb39fcf8f85bd3"
    "5341037102b6fb387ebcb7b1c8bff1aeda5f7be94f20ab1c9f6449094cfb0f56"
)
noextract=()
validpgpkeys=()

package() {
    unzip -o wakapi_linux_amd64.zip
    install -Dm755 "wakapi" "$pkgdir/usr/bin/wakapi"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/wakapi/LICENSE"
    install -Dm644 "config.yml" "$pkgdir/etc/wakapi/config.yml"
}
