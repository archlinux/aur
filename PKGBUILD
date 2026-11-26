# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=slasha-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Self-hosted PaaS in a single binary that runs on any server"
arch=('x86_64' 'aarch64')
url="https://github.com/slashacom/slasha"
license=('MIT')
depends=('glibc' 'libgcc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/slashacom/slasha/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/slasha-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/slasha-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('67de0ab8847012e9ce62d52a651e155dc7a6065895404eaef3621ab3c77aaebc')
sha256sums_x86_64=('bff7ea626129a3f9834d4f657382ac8cd15a23e13ce76a2d49d313ced49d587b')
sha256sums_aarch64=('db8f8ec7508937ba259bbd0960bfc2a580c0768c180ea9ad35f9f515f18586f6')

package() {
  install -Dm755 "slasha" "${pkgdir}/usr/bin/slasha"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
