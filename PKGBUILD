# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: felix <`base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==`>
pkgname=(pcf-unifont
         psf-unifont)
pkgbase=unifont
pkgver=15.0.06
pkgrel=2
pkgdesc="GNU Unifont Glyphs"
arch=('any')
url="https://unifoundry.com/unifont/index.html"
license=('GPL2' 'custom:OFL')
source=("https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/unifont-$pkgver.pcf.gz"{,.sig}
        "https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/Unifont-APL8x16-$pkgver.psf.gz"{,.sig}
        "https://unifoundry.com/LICENSE.txt")
sha256sums=('9aef06a77187df2ae4bff973bbbaf8866c98ffab6c7755c6ebfb916a96b118b1'
            'SKIP'
            'f6845bb729ac22845398925b93932469b32a25cf9450c071683808b7b8db6fd6'
            'SKIP'
            '1e74cb82bf476843e97c2596297b04219b1a7e51f7238944a8c031cb9401fa87')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>

package_pcf-unifont() {
  pkgdesc+=" (PCF version)"
  cd "$srcdir"
  install -Dm644 "unifont-$pkgver.pcf.gz" "$pkgdir/usr/share/fonts/misc/unifont.pcf.gz"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

package_psf-unifont() {
  pkgdesc+=" (PSF version)"
  cd "$srcdir"
  install -Dm644 "Unifont-APL8x16-$pkgver.psf.gz" "$pkgdir/usr/share/kbd/consolefonts/Unifont-APL8x16.psf.gz"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
