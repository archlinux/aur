# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-flat'
pkgver='1.07'
pkgrel='1'
pkgdesc="Implements a flat filesystem"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-copy-recursive>=0.35' 'perl-file-remove>=0.38' 'perl>=5.006' 'perl-prefork>=0.02')
makedepends=()
checkdepends=('perl-test-classapi>=1.04')
url='https://metacpan.org/release/File-Flat'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/File-Flat-1.07.tar.gz')
md5sums=('2e58179a4cc6d8fdacaa8e5224b3414d')
sha512sums=('98ae462c3f840c5e661753aa37d1501ded78e8e20d49d00811187e280c70caf3431fcb2cc83311116adb3303676837b20e421da646d7d05c0573b22f6549f9ce')
_distdir="File-Flat-1.07"

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
