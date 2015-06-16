# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-exception-handler'
pkgver='1.004'
pkgrel='1'
pkgdesc="Report exceptions with formatted text call-stack"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Exception-Handler'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOMMY/Exception-Handler-1.004.tar.gz')
md5sums=('62867ab3a5ccedb3a33b7a949d59e7f5')
sha512sums=('bacf05e5f6ae2edfd914315a2e677ad80bb018ad0460eb177e0e05170de87c8168f4dd44e312de343abf6b143fd87fbd2f5a9107953f5c2fa15802e926d60fca')
_distdir="Exception-Handler-1.004"

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
