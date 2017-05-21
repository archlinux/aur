# Maintainer: Michael M. Tung <mtung@mat.upv.es>
pkgname=perl-audio-cuefile-parser
pkgver=0.02
pkgrel=1
pkgdesc='This packages the Audio-Cuefile-Parser distribution, containing the Audio::Cuefile::Parser module!'
_dist=Audio-Cuefile-Parser
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/BAZ/$_dist-$pkgver.tar.gz")
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MATTK/$_dist-$pkgver.tar.gz")
md5sums=('2cd3e55708c25f0ddecce29a39e604ef')

build() {
  cd "$srcdir/$_dist"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
