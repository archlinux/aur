# Maintainer: JoshuaRLi <joshua.r.li.98 at gmail com>
# Please submit comments/issues here: https://github.com/JoshuaRLi/PKGBUILDs

pkgname=yn
pkgver=1.1.3
pkgrel=1
pkgdesc="an interactive y/n prompt"
arch=('x86_64')
url="https://github.com/JoshuaRLi/yn"
license=('MIT')
conflicts=('yn-bin')

source_x86_64=("${url}/releases/download/${pkgver}/yn-${pkgver}.tar.gz")
sha512sums_x86_64=('ba6fb9fd7323521bdd825dcd60485e7c8595dc1608827e7d5a6f43e8e0544ac00ee9e33186d74a01d50de96e56e461578b130bbf00e0c9319ae57dae0c976238')

package () {
  cd "${srcdir}/yn-${pkgver}"
  make CC='cc' PREFIX="${pkgdir}/usr" install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
