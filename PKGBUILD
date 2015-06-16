# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-term-progressbar-simple'
pkgver='0.03'
pkgrel='1'
pkgdesc="simpler progress bars"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-term-progressbar-quiet')
makedepends=()
url='http://search.cpan.org/dist/Term-ProgressBar-Simple'
source=('http://search.cpan.org/CPAN/authors/id/E/EV/EVDB/Term-ProgressBar-Simple-0.03.tar.gz')
md5sums=('c684f83c41f615775cca0dcf739561b6')
sha512sums=('68374d5261ef579d149faac84b829aaf39c29e064e5380e5f403746e89017c226a865d0f454cdf2c8dbc3401ced60215042de43aae43c1c0493027fa8f8f69d7')
_distdir="Term-ProgressBar-Simple-0.03"

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
