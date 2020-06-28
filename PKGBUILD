# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fontlink-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Program to install fonts temporarily on Unix-like systems"
arch=('any')
url='https://danpla.github.io/fontlink'
license=('ZLIB')
provides=('fontlink')
depends=('python')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.deb::https://github.com/danpla/fontlink/releases/download/v${pkgver}/fontlink_${pkgver}-1_all.deb")
sha256sums=('b9ea47bc671baedd32b3555e0e2e2113925788da9cbb3ab47574ac9615f13436')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 "${pkgdir}/usr/share/doc/fontlink/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/usr/share/doc/fontlink/copyright"
  rm "${pkgdir}/usr/share/doc/fontlink/changelog.Debian.gz"
}