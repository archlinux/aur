# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-json-schema-fast'
pkgver='0.10'
pkgrel='1'
pkgdesc="a fast JSON Schema (draft 2020-12) validator"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-fetch>=0.08' 'perl-file-raw-json>=0.07' 'perl-object-proto>=0' 'perl>=5.8.3')
makedepends=()
url='https://metacpan.org/release/JSON-Schema-Fast'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/JSON-Schema-Fast-$pkgver.tar.gz")
md5sums=('da67e52ccbc4b8324b95ef8b3fc0eba1')
sha512sums=('6c22c55230a99fef1f35456ccaaa529bbd95d9d3e6bdef2187f95e60e05eb6d30dd73788c8296d26d9a325b892022e354a22e7c7e175e7fece0730de55e8a68b')
_distdir="JSON-Schema-Fast-$pkgver"

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
