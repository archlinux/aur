# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-file-countlines'
pkgver='0.0.3'
pkgrel='1'
pkgdesc="Efficiently count the number of line breaks in a file"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=('perl-module-build>=0.36')
url='https://metacpan.org/release/File-CountLines'
source=('http://search.cpan.org/CPAN/authors/id/M/MO/MORITZ/File-CountLines-v0.0.3.tar.gz')
md5sums=('b27721b242c6ee42025a01af838deac9')
sha512sums=('84adcb4b8ba24f4ea2f23fe4df6da925cdc0f5ff5354a509af50398dfbe58114af7e940f358d4fbcae6acc1af5229e80d0f337d7cbcdaeafb15e856514dcfa41')
_distdir="File-CountLines-v0.0.3"

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
