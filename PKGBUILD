# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-config-ini-reader-ordered'
pkgver='0.022'
pkgrel='1'
pkgdesc=".ini-file parser that returns sections in order"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-config-ini>=0' 'perl>=5.012')
makedepends=()
url='https://metacpan.org/release/Config-INI-Reader-Ordered'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Config-INI-Reader-Ordered-0.022.tar.gz')
md5sums=('d0f595f053ee1ab7474ca1f429f966df')
sha512sums=('027e66e76ab4b7857b8aa85de740f614a56a958262de664c2dd8d58890f839799d5433c6699eeb38eb4f72d0111d0df55df05201e3a360a4775ddd0bf4d3a1d7')
_distdir="Config-INI-Reader-Ordered-0.022"

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
