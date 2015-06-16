# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-module-util'
pkgver='1.09'
pkgrel='1'
pkgdesc="Module name tools and transformations"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.5.3')
makedepends=()
url='http://search.cpan.org/dist/Module-Util'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MATTLAW/Module-Util-1.09.tar.gz')
md5sums=('4b7cc19f3f998e2d543ae033fbcb5666')
sha512sums=('6669216598c5a3b41964e65792fa5bdea9675150bf2ef908ed3e154b9fbc207de0b766feaebc2656a5379393cf8acafa5e27aeb694b9a56d8ff3b5f9c35837ad')
_distdir="Module-Util-1.09"

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
