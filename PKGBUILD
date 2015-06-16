# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-locale-maketext-gettext'
pkgver='1.28'
pkgrel='1'
pkgdesc="Joins gettext and Maketext frameworks"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Locale-Maketext-Gettext'
source=('http://search.cpan.org/CPAN/authors/id/I/IM/IMACAT/Locale-Maketext-Gettext-1.28.tar.gz')
md5sums=('a5fd46056d0c7bcf4781dc922451a82c')
sha512sums=('16795a82f252c79e285f6d0f7e87b9903994caf43f717bb8cce5b148d3559c41e5c7bd5312081a8a5bb435600efeee46992bca6f18407c88a5b496c6e37eb27a')
_distdir="Locale-Maketext-Gettext-1.28"

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
