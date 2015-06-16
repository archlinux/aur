# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-data-taxi'
pkgver='0.96'
pkgrel='1'
pkgdesc="Taint-aware, XML-ish data serialization"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-debug-showstuff>=1.1')
makedepends=()
url='http://search.cpan.org/dist/Data-Taxi'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIKO/Data-Taxi-0.96.tar.gz')
md5sums=('267cf3f2121ed4f5a622e85b56799a60')
sha512sums=('660d6bb8e10ad5666428e0b110b0117d6b122d343c79fbe14b54177486a3cb2fbd9070626eec90a0cf28b600bcaeb685bfb7e0722c83f9e19f1cfa32ddf2124c')
_distdir="Data-Taxi-0.96"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
