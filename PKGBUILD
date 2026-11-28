# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=occamy-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Remote desktop proxy"
arch=('x86_64' 'aarch64')
url="https://github.com/changkun/occamy"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/occamyd-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/occamyd-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('8977556727264f67063ad0ef216b8d07d5051928dff007325f857a5cf5e5e56a')
sha256sums_aarch64=('3652ee3df411ca15958a1ccd6feffe64755db71a351b84ca01b4db5e70e2e8f1')

package() {
  install -Dm755 "occamyd" "${pkgdir}/usr/bin/occamyd"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
