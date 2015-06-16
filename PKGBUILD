# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-tk-statusbar'
pkgver='0.04'
pkgrel='1'
pkgdesc="A statusbar widget for Perl/Tk"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-tk')
makedepends=()
url='http://search.mcpan.org/dist/Tk-StatusBar'
source=('http://search.mcpan.org/CPAN/authors/id/Z/ZA/ZABEL/Tk-StatusBar-0.04.tar.gz')
md5sums=('cdcf1bba733077aaa3b93d38209e9a78')
sha512sums=('5a281c66f23530440279a1b392cbab05f05c08b837d0d5b08ccc8375b8334640e25101f181bf3427006d53305b05ff4368e045f7eb217402cc4bd68dda47f99b')
_distdir="Tk-StatusBar-0.04"

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
