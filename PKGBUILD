# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-string-flogger'
pkgver='1.101245'
pkgrel='1'
pkgdesc="string munging for loggers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json-maybexs' 'perl-params-util' 'perl-sub-exporter')
makedepends=()
url='https://metacpan.org/release/String-Flogger'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/String-Flogger-1.101245.tar.gz')
md5sums=('e8de99012e46e31027107a548362bf25')
sha512sums=('6bd9c413ba1816221278521f6a43d475f4d4748be23034da0340b37e20044afb2d26e03b7529ddac3d98485cc1de69a4b0dcffe75ce61eea1eed7b154ab6e11e')
_distdir="String-Flogger-1.101245"

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
