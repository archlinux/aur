# Contributor: Andreas dot Wagner at em dot uni-frankfurt dot de
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=perl-file-slurp-unicode
_cpanname=File-Slurp-Unicode-master
pkgver=0.7.1
pkgrel=1
pkgdesc="Reading/Writing of Complete Files with Unicode Support (obsolete)"
arch=('any')
url="https://github.com/caldwell/File-Slurp-Unicode"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-file-slurp')
options=('!emptydirs')
source=(https://github.com/caldwell/File-Slurp-Unicode/archive/master.zip)

build() {
  cd $srcdir/${_cpanname}
  perl Build.PL installdirs=vendor destdir=$pkgdir || return 1    
  perl Build
}

package() {
  cd $srcdir/${_cpanname}
  perl Build install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}

md5sums=('5a5b25f700c928d93e7445be12ed79fb')
