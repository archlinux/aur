# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-util'
pkgver='4.201720'
pkgrel='1'
pkgdesc="Easy, versatile, portable file handling"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.28' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-nowarnings>=0')
url='https://metacpan.org/release/File-Util'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOMMY/File-Util-4.201720.tar.gz')
md5sums=('093fe77c4658f98375c7f6cc68694948')
sha512sums=('7f422d8634b9b73a51117fdc7f95999fd07ac60beddce0cba4eed6a45173f79e727e8e10a4342949d3b0c2a89a985ce1abe66f827d7027c5727dc009fd29e1df')
_distdir="File-Util-4.201720"

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
