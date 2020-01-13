# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=ohcount
pkgver=4.0.0
pkgrel=1
pkgdesc="source-lines of code counter"
arch=('any')
url="http://labs.ohloh.net/ohcount"
license=('GPL')
depends=('pcre')
makedepends=('ragel>=6.3' 'swig' 'ruby' 'ruby-rake' 'gperf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/blackducksoftware/ohcount/archive/${pkgver}.tar.gz")
sha256sums=('d71f69fd025f5bae58040988108f0d8d84f7204edda1247013cae555bfdae1b9')


build() {
  cd "${pkgname}-${pkgver}"

  ./build ohcount
}

package() {
  cd "${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}/usr/bin"
  cp bin/ohcount "${pkgdir}/usr/bin/"
}
