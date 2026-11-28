# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=chrome-debloat-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Debloat Chrome, Brave, Edge and Chromium with policies"
arch=('x86_64' 'aarch64')
url="https://github.com/NVFP4/chrome-debloat"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/NVFP4/chrome-debloat/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/chrome-debloat-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/chrome-debloat-linux-aarch64.tar.gz")
sha256sums=('a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9')
sha256sums_x86_64=('1ba8df843a4ae5dad5e12dec0637616d67ba1efb1b4b6302cf7b235a3aa037cf')
sha256sums_aarch64=('ad86433ba636a3b349a0f7dc18d6a2aa0e0f83573e33146de77526e950c22453')

package() {
  install -Dm755 "chrome-debloat" "${pkgdir}/usr/bin/chrome-debloat"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
