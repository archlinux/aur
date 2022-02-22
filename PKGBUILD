# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi-bin
pkgver=2.2.2
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
    "wakapi-${pkgver}.zip::https://github.com/muety/wakapi/releases/download/${pkgver}/wakapi_linux_amd64.zip"
    "https://raw.githubusercontent.com/muety/wakapi/master/LICENSE"
)
sha256sums=(
    "d6200be715cf07571cad395420aa0a322992c7ebdcdfec4ca74b0ec842dd4a8c"
    "5341037102b6fb387ebcb7b1c8bff1aeda5f7be94f20ab1c9f6449094cfb0f56"
)
noextract=()
validpgpkeys=()

package() {
    unzip -o "wakapi-${pkgver}.zip"
    install -Dm755 "wakapi" "${pkgdir}/usr/bin/wakapi"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/wakapi/LICENSE"
    install -Dm644 "config.yml" "${pkgdir}/etc/wakapi/config.yml"
}
