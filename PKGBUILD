# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-time-parsedate'
pkgver='2013.1113'
pkgrel='1'
pkgdesc="date parsing both relative and absolute"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Time-ParseDate'
source=('http://search.mcpan.org/CPAN/authors/id/M/MU/MUIR/modules/Time-ParseDate-2013.1113.tar.gz')
md5sums=('53c0de57d10af5021f653afe728ba700')
sha512sums=('1c68a1fda18ba5844683b1264d254daee851569917aa97ed41a760d8e9d83d97c5a8696860137648cd7fdc93b029c6b973af67e9a264d61777c427ed6fa45b02')
_distdir="Time-ParseDate-2013.1113"

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
