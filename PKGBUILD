# Maintainer: Taboon Egon <te451 -_AT_- netcourrier -_DOT_- com>
# Contributor: TrialnError <autumn-wind -_AT_- web -_DOT_- de>
# Contributor: Narrat <address??? at domain??? dot tld???>
# Contributor: der_fenix <derfenix -_AT_- gmail -_DOT_- com>
pkgname=semantik
pkgver=1.0.6
pkgrel=1
pkgdesc="mindmapping-like tool for document generation (reports, thesis, etc)"
arch=('x86_64')
url="https://waf.io/semantik.html"
license=('GPL3')
depends=('qt5-webengine' 'qt5-svg' 'kdelibs4support' 'kio' 'python'
         'shared-mime-info' 'desktop-file-utils')
source=("https://waf.io/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('2a36def6c63a5e03f66f5d416964f544e7d1e26a794798be492d2b4869657a4a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./waf configure clean build
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./waf install --destdir=${pkgdir} --nomimes --noldconfig --nogtkicons
}
