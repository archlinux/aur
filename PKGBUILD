# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-term-size'
pkgver='0.211'
pkgrel='1'
pkgdesc="Retrieve terminal size on Unix"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Term-Size'
source=('http://search.cpan.org/CPAN/authors/id/F/FE/FERREIRA/Term-Size-0.211.tar.gz')
md5sums=('150b398d5be255883e59e12414c4a0cd')
sha512sums=('0762951a6125dace8c67548667b8ca353b34199412fbd4c05d417a49a6d3f5bb93172736fcef98e049f094f2fdc62efd334e64f9357c7778665f2aa2bb775e0f')
_distdir="Term-Size-0.211"

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
