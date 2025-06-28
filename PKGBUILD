# Maintainer: kati dev <katifetchs@gmail.com>

pkgname=katifetch
pkgver=1.2
pkgrel=1
pkgdesc="Highly customizable system info tool, easier to configure than Neofetch or Fastfetch"
arch=('any')
url="https://github.com/ximimoments/katifetch"
license=('MIT')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ximimoments/katifetch/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fe2f2c7dc4b6e469e74230f69a587169483fb6edbca402bc37ee697a3515bd6d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 katifetch.sh "${pkgdir}/usr/bin/katifetch"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r logos themes "${pkgdir}/usr/share/${pkgname}/"
}
