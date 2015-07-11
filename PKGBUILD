# Maintainer: Maurizio D'Addona <mauritiusdadd@libero.it>

pkgname=crtwo2fits
pkgver=0.1.0
pkgrel=1
pkgdesc="A ready-to-use tool and a python module for converting CR2 raw files into FITS images"
arch=(any)
url="https://github.com/mauritiusdadd/crtwo2fits"
license=('GPL3')
provides=('crtwo2fits')
conflicts=('crtwo2fits')
depends=('python-astropy')
optdepends=('dcraw: for faster image decoding')

source=("https://github.com/mauritiusdadd/crtwo2fits/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('820061c7288360a73dea2ebd92d03c796902af24ca80f68971e50279bd3d00c5')


build()
{
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr"
  python setup.py install --prefix="$pkgdir/usr"

  install -Dm664 "${pkgdir}/usr/share/crtwo2fits/crtwo2fits.conf" "${pkgdir}/etc/crtwo2fits.conf"
}

