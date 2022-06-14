# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-plugin-session'
pkgver='0.43'
pkgrel='1'
pkgdesc="Generic Session plugin - ties together server side storage and client side state required to maintain session data."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.71001' 'perl-html-parser>=0' 'perl-mro-compat>=0' 'perl-moose>=0.76' 'perl-moosex-emulate-class-accessor-fast>=0.00801' 'perl-object-signature>=0' 'perl-namespace-clean>=0.10' 'perl>=5.8.0')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-exception>=0' 'perl-test-www-mechanize-psgi>=0')
url='https://metacpan.org/release/Catalyst-Plugin-Session'
source=("https://cpan.metacpan.org/authors/id/H/HA/HAARG/Catalyst-Plugin-Session-$pkgver.tar.gz")
md5sums=('18fc3e30afc60cfbadc2220842b08f65')
sha512sums=('5e41cab3c37d8dee7aceb386f0b9e8d0f01771d1d4d26403acdf2a4ea5966af81406afbf1032b62178613e6186228d8f8f3b7accd03d9b9db709d6727ac76be1')
_distdir="Catalyst-Plugin-Session-$pkgver"

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
