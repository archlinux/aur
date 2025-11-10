# Maintainer: William Varmus <0@willvar.tw>

pkgname=aurpick
pkgver=1.0.0
pkgrel=1
pkgdesc="Easily install any version of AUR packages — current, historical, or newer."
arch=('any')
url="https://github.com/willvar/aurpick"
license=('MIT')
depends=('git' 'fzf' 'base-devel')
optdepends=('downgrade: for official repository packages')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/willvar/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('778cacc458a35cb5a0c790c53e8b99c2ad2e557f546362c366b5d5eee48a8000')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install the main script
  install -Dm755 aurpick "${pkgdir}/usr/bin/aurpick"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 README.zh.md "${pkgdir}/usr/share/doc/${pkgname}/README.zh.md"
}
