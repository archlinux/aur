# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi-bin
pkgver=2.2.5
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
    '0dd975db8bf3795aa73ba86b2f7b6815094ed97920e2e97413d9f3ed44f0999722f0d72f67087dae0379bf0d3a806a6e4cdfccc33e6b0a9ab84fb8b36b7285ed'
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
