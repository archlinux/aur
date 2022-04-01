# Maintainer: Ronald van Haren <ronald.archlinux.org>

pkgname=bdf-unifont
pkgver=14.0.02
pkgrel=1
pkgdesc="GNU Unifont Glyphs"
arch=('any')
license=('custom' 'GPL2')
url="https://ftp.gnu.org/gnu/unifont"
source=("https://ftp.gnu.org/gnu/unifont/unifont-${pkgver}/unifont-${pkgver}.bdf.gz"{,.sig} "LICENSE")
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy
sha256sums=('5b314364d23143755a4b11b641a953c07837f48fefcc7454318e334265e4974b'
            'SKIP'
            'b301a70ea554b471ca22f9654d8fe0573a93c1ecae3f59f17026f12e58f31e3a')

package() {
  gzip -d --force "$srcdir"/unifont-${pkgver}.bdf.gz
  install -Dm644 "${srcdir}/unifont-${pkgver}.bdf" \
    "${pkgdir}/usr/share/fonts/misc/unifont.bdf"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
