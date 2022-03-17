# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi-bin
pkgver=2.3.0
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
    'e3138f04a784cf29c1bc2f87e1989d4af17122558a843069424236d7dff003513b9a86bbb54fbf53a6a7048c76d3211516b6f4a66722abdb17753f6e1db34ace'
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
