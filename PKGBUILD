# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-datetime-tiny'
pkgver='1.04'
pkgrel='1'
pkgdesc="A datetime object with as little code as possible"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.004')
makedepends=()
url='http://search.cpan.org/dist/DateTime-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/DateTime-Tiny-1.04.tar.gz')
md5sums=('9e7e4fe588445023763df113d3f2345f')
sha512sums=('da065b983ef7362a3190d1e0758fc071ded7c216c5bbff2aa111b9211b6deffdfa6c17a12ec6aa4c0fc51a091ea753d05c9b00acb4e30f57b6b99a66236de3c1')
_distdir="DateTime-Tiny-1.04"

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
