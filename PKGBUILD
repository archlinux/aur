# Maintainer: Mikele <mikele@gmail.com>

pkgname=alsachain-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Safe ALSA alsaequal virtual PCM manager'
arch=('x86_64')
url='https://github.com/mikelexp/alsachain'
license=('custom')
depends=('glibc' 'alsa-lib' 'alsa-utils' 'caps' 'alsaequal')
source=("${url}/releases/download/v${pkgver}/alsachain-${pkgver}-linux-${CARCH}.tar.gz")
sha256sums=('934fc75a919cb5da507d2df53dba35e51eb37516bc44d2a3d25fdf0352141cd1')

package() {
  install -Dm755 "${srcdir}/alsachain" "${pkgdir}/usr/bin/alsachain"
  install -Dm755 "${srcdir}/libasound_module_pcm_alsachain_status.so" "${pkgdir}/usr/lib/alsa-lib/libasound_module_pcm_alsachain_status.so"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
