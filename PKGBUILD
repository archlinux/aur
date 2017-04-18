# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-util'
pkgver='4.161950'
pkgrel='1'
pkgdesc="Easy, versatile, portable file handling"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.28' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-nowarnings')
url='https://metacpan.org/release/File-Util'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOMMY/File-Util-4.161950.tar.gz')
md5sums=('5706487ecf0daae885f709914915e832')
sha512sums=('1678d0075b2ebcb014a101cfec39e462ab4c4380db48016adb0d4d65a532dc215ecead10fe440df8a00cee9ec882a9e4df25d28228fc30f66918492ef64344de')
_distdir="File-Util-4.161950"

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
