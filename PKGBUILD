# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astromatic-swarp
_pkgname=swarp
pkgver=2.38.0
pkgrel=2
pkgdesc="resamples and co-adds together FITS images using any arbitrary astrometric projection defined in the WCS standard."
url="http://www.astromatic.net/software/swarp"
arch=('x86_64')
license=('GPL')
depends=('astromatic-sextractor')
optdepends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=(http://www.astromatic.net/download/swarp/swarp-${pkgver}.tar.gz)
sha1sums=('fe21463a64f225224267e7408468a33aeec5b7e9')

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/${_pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
