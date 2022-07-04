# Maintainer: Gaoyang Zhang <gy@blurgy.xyz>
pkgname=wakapi-bin
pkgver=2.3.7
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
  'fd6749501b776b6a7a919bb1ff5ac005f52b48231854f12653ab92784ca89704f2214f96d4abaa80260a30c04b7acb16d98594969eb63d58e96c22a3ca0ab445'
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
