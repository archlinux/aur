# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-plugin-session'
pkgver='0.44'
pkgrel='1'
pkgdesc="Generic Session plugin - ties together server side storage and client side state required to maintain session data."
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.71001' 'perl-crypt-sysrandom>=0.007' 'perl-html-parser>=0' 'perl-mro-compat>=0' 'perl-moose>=0.76' 'perl-moosex-emulate-class-accessor-fast>=0.00801' 'perl-object-signature>=0' 'perl-plack>=0' 'perl-namespace-clean>=0.10' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-needs>=0')
url='https://metacpan.org/release/Catalyst-Plugin-Session'
source=("http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/Catalyst-Plugin-Session-$pkgver.tar.gz")
md5sums=('32984ac460ca44ad2f566205010c249a')
sha512sums=('c45cda4489542c249feb5eadebec89db05445201141079f4813d2b29719acb41232a3abc0efc72ea92be32af36841291ae53699f8a6212d252e2df03a2cce202')
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
