# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi-bin
pkgver=2.10.0
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
  '11a06fdb7d656cac7c5e74b7dc9fd52e278803d12364febe0ad3e90e0d0154d195f2615be607cc4f0d4385715c7b00e29e7e7e605414968a8726fe24b7c3387e'
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
