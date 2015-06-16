# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-cpanplus-dist-gentoo'
pkgver='0.12'
pkgrel='1'
pkgdesc="CPANPLUS backend generating Gentoo ebuilds."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='http://search.cpan.org/dist/CPANPLUS-Dist-Gentoo'
source=('http://search.cpan.org/CPAN/authors/id/V/VP/VPIT/CPANPLUS-Dist-Gentoo-0.12.tar.gz')
md5sums=('6474bd611a43db3f6e7ac471cbfac492')
sha512sums=('b834eaaac94d4370c10399dcba1515fa32f3b716ed1baf6caef219edcb6b8fa27ba3b85ee38c552147220df7b164db82e7991c361e6c2e94d450f3f27757e9eb')
_distdir="CPANPLUS-Dist-Gentoo-0.12"

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
