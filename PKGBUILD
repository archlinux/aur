# Maintainer: Morten Linderud <morten@linderud.pw> 

pkgname=texcount
pkgver=3.0.0.24
pkgrel=1
pkgdesc='TeXcount is a Perl script for counting words in LaTeX documents. It parses valid LaTeX documents counting words, headers, formulae (mathematics) and floats/begin-end groups.'
arch=('any')
url='http://app.uio.no/ifi/texcount/'
license=('LPPL')
depends=('perl')
source=("${pkgname}_${pkgver}.zip::http://app.uio.no/ifi/texcount/download.php?file=texcount_${pkgver//./_}.zip")
makedepends=('unzip')
noextract=("${pkgname}_${pkgver}.zip")
sha256sums=('0347fb8b5a77342f8853ff3bcf017f941664e624153f969e66933ea54b868944')

prepare() {
  unzip -qo ${srcdir}/${pkgname}_${pkgver}.zip
}

package() {
  install -D ${srcdir}/texcount.pl ${pkgdir}/usr/bin/texcount
}
