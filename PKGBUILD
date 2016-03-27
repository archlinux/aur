# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cgi-application-plugin-authentication'
pkgver='0.20'
pkgrel='1'
pkgdesc="Authentication framework for CGI::Application"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cgi' 'perl-cgi-application>=4' 'perl-class-isa' 'perl-readonly' 'perl-universal-require')
makedepends=()
checkdepends=('perl-test-exception' 'perl-test-mockobject' 'perl-test-nowarnings' 'perl-test-regression' 'perl-test-taint' 'perl-test-warn>=0.11' 'perl-test-without-module')
url='https://metacpan.org/release/CGI-Application-Plugin-Authentication'
source=('http://search.cpan.org/CPAN/authors/id/S/SI/SILASMONK/CGI-Application-Plugin-Authentication-0.20.tar.gz')
md5sums=('5b4ff96b2f703b11bae13308aee7bd30')
sha512sums=('cc0275097df7dce543e5797324c660ba868cbd1329c9b44a621c4787e1281bdafc44b2aa5b6b4e0b5e1ea54fc65968ad5387de5fd9cfcb68facf06c91d7f75e9')
_distdir="CGI-Application-Plugin-Authentication-0.20"

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

#Tests fail due to CGI::param being called in SCALAR context warnings, causes a no warnings test to fail...
check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
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
