# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-strictures'
pkgver='2.000000'
pkgrel='1'
pkgdesc="turn on strict and make all warnings fatal"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-bareword-filehandles' 'perl-indirect' 'perl-multidimensional' 'perl')
makedepends=()
url='http://search.mcpan.org/dist/strictures'
source=('http://search.mcpan.org/CPAN/authors/id/H/HA/HAARG/strictures-2.000000.tar.gz')
md5sums=('272d98533003581f42cafebfd95bfc5b')
sha512sums=('94ecc46877253ff590bf9aba6637bd295e2f95c83d2dcabbcd0b73f7b6de07f2f5cef61f2e4d097057ba200298fb4b9cd992d0d23892433167afab47753bcffa')
_distdir="strictures-2.000000"

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
