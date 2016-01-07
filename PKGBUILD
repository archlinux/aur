# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-parse-errorstring-perl'
pkgver='0.22'
pkgrel='1'
pkgdesc="Parse error messages from the perl interpreter"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-xsaccessor' 'perl-pod-pom>=0.27' 'perl')
makedepends=()
checkdepends=('perl-test-differences')
url='https://metacpan.org/release/Parse-ErrorString-Perl'
source=('http://search.cpan.org/CPAN/authors/id/S/SZ/SZABGAB/Parse-ErrorString-Perl-0.22.tar.gz')
md5sums=('6d31fde40a67b6b392652e04e10b8765')
sha512sums=('a1a99a876cd575adfcd30a3f73ed23c104380b32e24f34fc135b315794c640a37369abe10aea0daa5a73da030a38b52439b4a4716cc3c2c5a610a524a9ced507')
_distdir="Parse-ErrorString-Perl-0.22"

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
