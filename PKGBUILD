# Contributor: lionel@les-miquelots.net
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-extutils-builder-compiler'
pkgver='0.028'
pkgrel='2'
pkgdesc="An interface around different compilers."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-extutils-builder>=0.016' 'perl-extutils-config>=0.007' 'perl-extutils-helpers>=0.027' 'perl>=5.010')
makedepends=()
url='https://metacpan.org/release/ExtUtils-Builder-Compiler'
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/ExtUtils-Builder-Compiler-$pkgver.tar.gz")
md5sums=('f6869533453b770c9f7e976bb75c6b56')
sha512sums=('1292d9a9ee396cc0e445c0d7f36c616fd79b66d61829a587f08fc6a2e8f7eace6cce74fc353879889c49e8bd4e3dc0937707486fce404ea022f3ecc08cd0d7a5')
_distdir="ExtUtils-Builder-Compiler-$pkgver"

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
