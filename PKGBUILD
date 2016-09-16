#PKGBUILD Maintainer: Rafael Reggiani Manzo <rr.manzo#gmail.com>

pkgname=analizo
pkgver=1.19.0
pkgrel=1
pkgdesc="Analizo is a free, multi-language, extensible source code analysis and visualization toolkit."
groups=('analizo')
arch=('any')
url="http://analizo.org"
license=('GPLv3')
depends=('perl' 'sloccount' 'doxyparse'
         'perl-chi' 'perl-app-cmd' 'perl-class' 'perl-data-uuid'
         'perl-digest-jhash' 'perl-list-moreutils' 'perl-file-homedir'
         'perl-file-copy-recursive' 'perl-getopt-euclid' 'perl-graph'
         'perl-list-compare' 'perl-mro-compat' 'perl-file-sharedir-install'
         'perl-params-util' 'perl-params-validate' 'perl-test-class'
         'perl-test-exception' 'perl-yaml' 'perl-statistics-descriptive'
         'perl-statistics-online' 'perl-findbin-libs' 'perl-graph-writer-dsm')
makedepends=('git')
source=("${url}/download/${pkgname}_${pkgver}.tar.xz")
sha512sums=('6f1a69545562e599dde68a4ddd1df90f36156a8e75b1c4883edb1496af3b78b2d00e72720c9833afcde0c54a65f8ee537edcd38a6eb30110042e19ab4c173bbc')

build(){
  cd "${srcdir}/${pkgname}"

  #Analizo
  perl Makefile.PL
  make
}

package(){
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}/" install

  ln -s /usr/bin/site_perl/analizo ${pkgdir}/usr/bin/analizo
}
