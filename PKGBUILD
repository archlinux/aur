# Maintainer: Taboon Egon <te451 -_AT_- netcourrier -_DOT_- com>
# Contributor: TrialnError <address??? at domain??? dot tld???>
# Contributor: Narrat <address??? at domain??? dot tld???>
# Contributor: der_fenix <address??? at domain??? dot tld???>
pkgname=semantik
pkgver=1.0.5
pkgrel=1
pkgdesc="mindmapping-like tool for document generation (reports, thesis, etc)"
arch=('x86_64')
url="https://waf.io/semantik.html"
license=('GPL3')
depends=('qt5-webengine' 'qt5-svg' 'kdelibs4support' 'kio' 'python'
         'shared-mime-info' 'desktop-file-utils')
source=("https://waf.io/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('6d26f04841a5b105c364074edca2765d5ceab0ad2f7f17614c62ecf65a4d79fe')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./waf configure clean build
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./waf install --destdir=${pkgdir} --nomimes --noldconfig --nogtkicons
}
