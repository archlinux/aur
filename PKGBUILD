# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=reviewengine-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="Multi-expert, scored AI code review"
arch=('x86_64' 'aarch64')
url="https://github.com/Liewzheng/ReviewEngine"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Liewzheng/ReviewEngine/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/review-engine-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/review-engine-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('9b1c44c16a2afd8806b9e28e45350edd5a8bbddc08c1ca7caacf8677b3f93c73')
sha256sums_x86_64=('aaa8e11152263dc9345410c5e50cf4ac9d47b947e8683600770b8f78baf9a370')
sha256sums_aarch64=('395bdbf501d0a5d500e59f757c9babb92c5d94a72cc28efe0d2748c41a994a67')

package() {
  install -Dm755 "review-engine" "${pkgdir}/usr/bin/review-engine"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
