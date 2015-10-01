# Maintainer: Maurizio D'Addona <mauritiusdadd@libero.it>

pkgname=crtwo2fits
pkgver=0.1.1
pkgrel=2
pkgdesc="A ready-to-use tool and a python module for converting CR2 raw files into FITS images"
arch=(any)
url="https://github.com/mauritiusdadd/crtwo2fits"
license=('GPL3')
provides=('crtwo2fits')
conflicts=('crtwo2fits')
depends=('python-astropy')
optdepends=('dcraw: for faster image decoding')

source=("https://github.com/mauritiusdadd/crtwo2fits/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('39e2a342a7c13af41f1a922ea45ea8004720e229e6a8d9dc6d88c4f2abcd1108')


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

