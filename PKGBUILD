# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-tie-orderedhash'
pkgver='1.00'
pkgrel='1'
pkgdesc="Ordered Hashes with a public C ABI"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl>=5.10.0')
makedepends=()
url='https://metacpan.org/release/Tie-OrderedHash'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Tie-OrderedHash-$pkgver.tar.gz")
md5sums=('31ee3c5e9932a2b3f00b6b360f4a70e9')
sha512sums=('8bf9c4c136dcdd3463eaf7e62dc6b73e81d2f0eea803226307f0d9e90fbeb807aeac70d25c41d8364ff5d5729df3a123642e4a36a62558e09b38135c26b9e8e9')
_distdir="Tie-OrderedHash-$pkgver"

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
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
