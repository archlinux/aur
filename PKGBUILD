# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-visitor'
pkgver='0.32'
pkgrel='1'
pkgdesc="Perl/CPAN Module Data::Visitor: Visitor style traversal of Perl data structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=0.89' 'perl-tie-toobject>=0.01' 'perl-namespace-clean>=0.19' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-needs')
url='https://metacpan.org/release/Data-Visitor'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Data-Visitor-$pkgver.tar.gz")
md5sums=('eea307c1211209ca9c6b286e7373813d')
sha512sums=('f192f851d0e31b432c89573d85a165c9bc7e7f687980610ed8841bc77d72a55d4d3a2c104bab04d0b797ebc18f4b134596683be865aa052cde2b837a02426632')
_distdir="Data-Visitor-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
