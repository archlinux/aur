# Maintainer: Victor Häggqvist <aur *AT* snilius *DOT* com>

pkgname=texcount
pkgver=3.0.0.24
pkgrel=1
pkgdesc="TeXcount is a Perl script that counts the number of words in the text of LaTeX files. It has rules for handling most of the common macros and provides colour coded output indicating which parts have been counted."
arch=('any')
url="http://app.uio.no/ifi/texcount/"
license=('LaTeX Project Public License')
makedepends=('unzip')
source=("${pkgname}_${pkgver}.zip::http://app.uio.no/ifi/texcount/download.php?file=${pkgname}_${pkgver//./_}.zip")
noextract=("${pkgname}_${pkgver}.zip")
sha1sums=('aca004deb2cab96a0c25083978b7cf1dbc1a55ee')

package() {
  cd "$srcdir"
  unzip "${pkgname}_${pkgver}.zip"

  # Binaries
  install -dm755 "${pkgdir}/usr/bin"
  cp texcount.pl "${pkgdir}/usr/bin/$pkgname"

  # Docs
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp README QuickReference.pdf TeXcount.pdf "${pkgdir}/usr/share/doc/${pkgname}/."
}
