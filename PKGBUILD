# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pigeons-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Peer-to-peer messaging that always finds its way home"
arch=('x86_64' 'aarch64')
url="https://github.com/n0-computer/pigeons"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/n0-computer/pigeons/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pigeons-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pigeons-v${pkgver}-linux-aarch64.tar.gz")
sha256sums=('5e753045ba863ff5eb120a2ab75118d9d596f1ecd9371456eab0da1173876ae9')
sha256sums_x86_64=('15c2fce476e5ecb79c8f2034033eac5cb136fee0ab5ca5a51881cf55658514be')
sha256sums_aarch64=('001ca075c06b94c80a358f942467438edbbb478ad708bb9506bff3e3d2f81d2a')

package() {
  install -Dm755 "./pigeons" "${pkgdir}/usr/bin/pigeons"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
