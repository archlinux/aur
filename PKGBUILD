# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vic-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="Trim videos in the terminal"
arch=('x86_64')
url="https://github.com/wong-justin/vic"
license=('GPL-3.0-only')
depends=('ffmpeg')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/wong-justin/vic/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/vic_x86_64_linux.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('b3f209960191cbd0151e3767ae4706f8ffb628903a115c1d9e5fdc436093d6ba')

package() {
  install -Dm755 "vic_x86_64_linux" "${pkgdir}/usr/bin/vic"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
