# Maintainer: kati dev <katifetchs@gmail.com>

pkgname=katifetch
pkgver=1.2
pkgrel=1
pkgdesc="Highly customizable system info tool, easier to configure than Neofetch or Fastfetch"
arch=('any')
url="https://github.com/ximimoments/katifetch"
license=('MIT')
depends=('bash')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ximimoments/katifetch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 katifetch.sh "${pkgdir}/usr/bin/katifetch"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Si tenés logos u otros módulos:
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r logos themes modules "${pkgdir}/usr/share/${pkgname}/"
}
