# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mousex-configfromfile'
pkgver='0.05'
pkgrel='5'
pkgdesc="An abstract Mouse role for setting attributes from a configfile"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-mouse>=0.39' 'perl-mousex-types-path-class>=0.06' 'perl>=5.8.1')
makedepends=('perl-module-install')
checkdepends=('perl-test-useallmodules>=0')
url='https://metacpan.org/release/MouseX-ConfigFromFile'
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MASAKI/MouseX-ConfigFromFile-$pkgver.tar.gz")
md5sums=('f6dc7f738085611949510c07301402ca')
sha512sums=('e9494cc44dafc4601b9e555b593717f99dc2b57acbcc52fd342a4e5b2bcb50e02dc82c2abe0564fa25e5ce52aa47ceed543efe29e63ec813158257d4cb1065ab')
_distdir="MouseX-ConfigFromFile-$pkgver"

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
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
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
