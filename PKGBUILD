# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=proxyt-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple proxy for the Tailscale control plane"
arch=('x86_64' 'aarch64')
url="https://github.com/jaxxstorm/proxyt"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/proxyt_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/proxyt_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('940c234ec6fccd2c2843a4c8ef823b6cdc535e76c7f4e275b9dbd9dc5c974764')
sha256sums_aarch64=('2bb459eae8b9788e4b9490ba8afd8558de21363c17bd6e85fa6bd622a035812c')

package() {
  install -Dm755 "proxyt" "${pkgdir}/usr/bin/proxyt"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
