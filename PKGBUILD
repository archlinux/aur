# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-plugin-session'
pkgver='0.41'
pkgrel='1'
pkgdesc="Generic Session plugin - ties together server side storage and client side state required to maintain session data."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.71001' 'perl-html-parser>=0' 'perl-mro-compat>=0' 'perl-moose>=0.76' 'perl-moosex-emulate-class-accessor-fast>=0.00801' 'perl-object-signature>=0' 'perl-namespace-clean>=0.10' 'perl>=5.8.0')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-exception>=0' 'perl-test-www-mechanize-psgi>=0')
url='https://metacpan.org/release/Catalyst-Plugin-Session'
source=('https://cpan.metacpan.org/authors/id/J/JJ/JJNAPIORK/Catalyst-Plugin-Session-0.41.tar.gz')
md5sums=('0f7824d7c906d874466e54819c08df11')
sha512sums=('684b3489d7259eb50b626cb29e83dca59abeaea8f7a338f09fe96c01bd927db6949ebb432b200c116a02a8501907f882ca2c163e920827f1fc755800f20187e3')
_distdir="Catalyst-Plugin-Session-0.41"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
