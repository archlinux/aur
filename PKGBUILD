# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=speakrs-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Speaker diarization with pyannote-level accuracy"
arch=('x86_64' 'aarch64')
url="https://github.com/avencera/speakrs"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/avencera/speakrs/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/speakrs-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/speakrs-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('df9814e4ecbf8471030cfceb14c3d06ed001a88d079be2f161738606a2a5faa8')
sha256sums_x86_64=('a886863ea86512bc4a33b90a02916d1ea7cedd732c3d02929d6d0f9957f10b06')
sha256sums_aarch64=('9cced877c1ce7ebe4bfa52ad1a269c1f7fd8f38cc414473b632fb35b291a65f8')

package() {
  install -Dm755 "speakrs" "${pkgdir}/usr/bin/speakrs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
