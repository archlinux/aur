# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-plack-middleware-logwarn'
pkgver='0.001002'
pkgrel='1'
pkgdesc="converts to warns to log messages"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-plack>=0.9979')
makedepends=()
checkdepends=('perl-test-deep>=0.108')
url='https://metacpan.org/release/Plack-Middleware-LogWarn'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MAESTRO/Plack-Middleware-LogWarn-0.001002.tar.gz')
md5sums=('af09ac414628425c3b7f262f320fa71e')
sha512sums=('c49ceeb9acb3dc5663f0f91a607dd0f0cc81b19372216717afc3609004d6173106bbb95c8fc7ccbf010a277265cb85657e663924b562c227cd28fae306f8b845')
_distdir="Plack-Middleware-LogWarn-0.001002"

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
