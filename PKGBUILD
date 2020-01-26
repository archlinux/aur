# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-cam-dbf'
pkgver='1.02'
pkgrel='2'
pkgdesc="Perl extension for reading and writing dBASE III DBF files (dbf2csv)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/pod/CAM::DBF'
source=('http://search.cpan.org/CPAN/authors/id/C/CL/CLOTHO/CAM-DBF-1.02.tgz')
md5sums=('4c8561dd0dc5bb17f8f1585aa4490ace')
sha512sums=('78acdd2e9366ecb8ca099d4d1ad25a29a06f922d2700644b9cf713a09b4a1c0e1e6794365a07f1e12b19c24f7fc80a963e9425470431664d9d2fca46b1d45226')
_distdir="CAM-DBF-1.02"

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
