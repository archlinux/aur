# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi-bin
pkgver=2.3.3
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
b2sums=(
    '4a1f567b627aa56af00deb36207d21ad3ca3bd043f8baf963108d348574cb1d70c1bf52fb6984810192c06a729655b3b1b6a6db0cd17e9189c04a910b6064ee6'
    '126d63c4c2e0c8f9546e0c658555a0c2f770f375c67089b8f42e20b9428369d7ce335d2751e7d4a851693c5de2f3955a5f1650ec258e3bc8cec66fa59acd39d6'
)
noextract=()
validpgpkeys=()

package() {
    unzip -o "wakapi-${pkgver}.zip"
    install -Dm755 "wakapi" "${pkgdir}/usr/bin/wakapi"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/wakapi/LICENSE"
    install -Dm644 "config.yml" "${pkgdir}/etc/wakapi/config.yml"
}
