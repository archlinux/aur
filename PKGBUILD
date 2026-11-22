# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sgram-tui-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A calibrated spectrogram analyzer for live mic or audio files, with labeled PNG figure export"
arch=('x86_64')
url="https://github.com/arian-shamaei/sgram-tui"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/arian-shamaei/sgram-tui/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/sgram-tui-linux-amd64")
sha256sums=('cca9e6c986bff7944b68df6934ae4babbab3379f3de8776e832ecb3c23f7dadb')
sha256sums_x86_64=('e82ad28fce5464800c6bf8c09fbcacede75ffc98a4a4ecaf7bfc469aede51189')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/sgram-tui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
