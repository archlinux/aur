# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-autoxs-header'
pkgver='1.02'
pkgrel='1'
pkgdesc="Container for the AutoXS header files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/AutoXS-Header'
source=('http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/AutoXS-Header-1.02.tar.gz')
md5sums=('bfed85ce503f6a2222b6ddd5cf7c41bc')
sha512sums=('96396cf791c15c0f230eb78d5c9ee41ecf37dc91bb2f61c0a4663df83222ccab9d5bb3cb9219796e7f729e92e065b791403cbaef72c2d7630e74f147a8bb8f27')
_distdir="AutoXS-Header-1.02"

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
