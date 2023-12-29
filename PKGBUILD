# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi-bin
pkgver=2.10.2
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
  'f0fa2adada084c5623876ba69e8adf2ee468856b491364777c4735b8b1311899d93e77b8d28cf785b7eaa97c1e49b3a22fc2f0c72538fa8106795e6208edbd1c'
  '70b100a6a08c18dd710d0ac9ae59acfb3fa9c6a02ff7090f59dfa94f41dd648a9f2e02fec6ba96cbe607c1ffcab3d9430366f45291649e033457ed436d9603fd'
)
noextract=()
validpgpkeys=()

package() {
  unzip -o "wakapi-${pkgver}.zip"
  install -Dm755 "wakapi" "${pkgdir}/usr/bin/wakapi"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/wakapi/LICENSE"
  install -Dm644 "config.yml" "${pkgdir}/etc/wakapi/config.yml"
}
