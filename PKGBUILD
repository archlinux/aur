# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-checkos'
pkgver='2.04'
pkgrel='2'
pkgdesc="check what OS we're running on"
arch=('any')
license=('GPL2' 'PerlArtistic' 'Artistic2.0')
options=('!emptydirs' 'purge')
depends=('perl-file-find-rule>=0.28' 'perl-test-warnings' 'perl>=5.6.0')
makedepends=()
url='https://metacpan.org/release/Devel-CheckOS'
source=('https://search.cpan.org/CPAN/authors/id/D/DC/DCANTRELL/Devel-CheckOS-2.04.tar.gz')
md5sums=('19f2608a513508522d2b75a24030af8e')
sha512sums=('efb2d723a704cabf1eda2521629f9cf1cf915ee45ab8bd8a81db11fba25fa2d3e5cb3fbb6252307cc3423b5edf775339a08141a8b9d2d06ad568a7b3bbc8c81b')
b2sums=('eab7bd56093fe9a182f378f910d698a34f4efa81832682319dfc65b6963daf77b502eb85d0c956d81c74ac4406b81037b4b64066753ff4319b49a30a13ce55d6')
_distdir="Devel-CheckOS-2.04"

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
