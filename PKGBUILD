# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astromatic-swarp
_pkgname=swarp
pkgver=2.41.5
pkgrel=1
pkgdesc="resamples and co-adds together FITS images using any arbitrary astrometric projection defined in the WCS standard."
url="http://www.astromatic.net/software/swarp"
arch=('x86_64')
license=('GPL')
depends=('astromatic-sextractor' 'cfitsio')
optdepends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=(https://github.com/astromatic/swarp/archive/${pkgver}.tar.gz)
sha1sums=('038178ca49edda647217a7986652b396e2a6543e')

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/${_pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
