# Maintainer: kati dev <katifetchs@gmail.com>

pkgname=katifetch
pkgver=1.3
pkgrel=1
pkgdesc="Highly customizable system info tool, easier to configure than Neofetch or Fastfetch"
arch=('any')
url="https://github.com/ximimoments/katifetch"
license=('MIT')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ximimoments/katifetch/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d109188c55be71a8f2328a5c2c3f78ebc9811f4a990e213f8734bbffedd82709')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 katifetch.sh "${pkgdir}/usr/bin/katifetch"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r themes "${pkgdir}/usr/share/${pkgname}/"
}
