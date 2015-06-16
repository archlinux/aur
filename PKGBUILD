# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-algorithm-dependency'
pkgver='1.110'
pkgrel='1'
pkgdesc="Base class for implementing various dependency trees"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-params-util>=0.31')
makedepends=('perl-test-classapi>=0.6')
url='http://search.cpan.org/dist/Algorithm-Dependency'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Algorithm-Dependency-1.110.tar.gz')
md5sums=('dc1dab2ac44c315caa092397423b1429')
sha512sums=('f10b80bdf0b5db2fdb8d8fb86454a1c2e93682c00504cd594f39820ca720a4d506689ca22777613e13a724b01d3f47f73643659807f3de2747202786cc1ea8d0')
_distdir="Algorithm-Dependency-1.110"

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
