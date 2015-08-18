# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-path-finddev'
pkgver='0.5.2'
pkgrel='1'
pkgdesc="Find a development path somewhere in an upper hierarchy."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-tiny>=0.010' 'perl-path-isdev>=0.2.2' 'perl-path-tiny>=0.054' 'perl-sub-exporter')
makedepends=()
url='https://metacpan.org/release/Path-FindDev'
source=('http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/Path-FindDev-0.5.2.tar.gz')
md5sums=('b494d775273230d3542851073c2a9da2')
sha512sums=('bf66a5725e470198135dd888b51966b7dcdd62d90c718a96057ece2c39813cc2e88f96a5c8687aeaec13f3e1696de7e183697a7424b1140aecbb171be3a5e800')
_distdir="Path-FindDev-0.5.2"

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
