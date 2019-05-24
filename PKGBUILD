# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-indistdir'
pkgver='1.112071'
pkgrel='1'
pkgdesc="test environment setup for development with IDE"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Test-InDistDir'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MITHALDU/Test-InDistDir-1.112071.tar.gz')
md5sums=('41fd6a8f84b6c352927501705bc085b6')
sha512sums=('fb34181df5668ad460218cc26825bbdfd087047a84b20c2c665c020e9fc95b8040ccc48114f497bde55202231da9e7a1b8dc909806d1e230957f0e210ae61517')
_distdir="Test-InDistDir-1.112071"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
