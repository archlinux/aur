# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-text-haml'
pkgver='0.990108'
pkgrel='1'
pkgdesc="Haml Perl implementation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri')
makedepends=()
url='http://search.cpan.org/dist/Text-Haml'
source=('http://search.cpan.org/CPAN/authors/id/V/VT/VTI/Text-Haml-0.990108.tar.gz')
md5sums=('7b1a1be19c83d5d460e248ee821518b8')
sha512sums=('ec63d7755ae59a8538eff6e2c11e9a6ec77f90f0105a122ee2097833084e4bd2f2e1a63d76a9d6a7cd541994d105bd515eb9c31b91ac7c8ef46f5f7cbd8ca122')
_distdir="Text-Haml-0.990108"

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
