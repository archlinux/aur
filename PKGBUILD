# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-classapi'
pkgver='1.06'
pkgrel='1'
pkgdesc="Provides basic first-pass API testing for large class trees"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-inspector>=1.12' 'perl-config-tiny>=2.00' 'perl-params-util>=1.00')
makedepends=()
url='http://search.cpan.org/dist/Test-ClassAPI'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Test-ClassAPI-1.06.tar.gz')
md5sums=('ee31a9e1ecedcf720a9e89461a83442e')
sha512sums=('f84385b8b83db52243513c86422775e448eaa3a0353a48e38c5fc4f6b5487ae59655c4a12745297f0c4416c1388b48e83c39065614a629f1343bf8693bddaa77')
_distdir="Test-ClassAPI-1.06"

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
