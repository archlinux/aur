# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi-bin
pkgver=2.2.0
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
    "b88e943a14357cdfc6cd3a94ace9a38d4552d23de6d7fe9672cd832f5deb29ab"
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
