# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-data-uniqid'
pkgver='0.12'
pkgrel='1'
pkgdesc="Perl extension for simple genrating of unique id's"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Data-Uniqid'
source=('http://search.cpan.org/CPAN/authors/id/M/MW/MWX/Data-Uniqid-0.12.tar.gz')
md5sums=('6bab3b5da09fedfdf60ce2629a7367db')
sha512sums=('fd12aae4a810fda88dd0f8296e73760d8d62357cb5ebc675a4b2804d9eee93ebfa01942c7057ad9092e80331504f2a38a3c8a576ccb630de10f5e563752ed6e3')
_distdir="Data-Uniqid-0.12"

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
