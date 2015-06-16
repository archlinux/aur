# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-cpanplus-dist-build'
pkgver='0.78'
pkgrel='1'
pkgdesc="CPANPLUS plugin to install packages that use Build.PL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpanplus>=0.84' 'perl')
makedepends=()
url='http://search.mcpan.org/dist/CPANPLUS-Dist-Build'
source=('http://search.mcpan.org/CPAN/authors/id/B/BI/BINGOS/CPANPLUS-Dist-Build-0.78.tar.gz')
md5sums=('9a40202a68fa13125b2adffc057cc053')
sha512sums=('733abc212ea6ec506bc90c43e3860ee08f3a0a4b5908311f9c68c119d6ac2dc62876d2f2f468bd23dfaf7bb336ebd73a4c01e462ffaceff0802aee935aab75df')
_distdir="CPANPLUS-Dist-Build-0.78"

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
