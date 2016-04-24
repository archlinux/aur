# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-b-hooks-op-check-entersubforcv'
pkgver='0.09'
pkgrel='1'
pkgdesc="Invoke callbacks on construction of entersub OPs for certain CVs"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-hooks-op-check>=0.19' 'perl-b-utils>=0.19')
makedepends=('perl-extutils-depends')
url='https://metacpan.org/release/B-Hooks-OP-Check-EntersubForCV'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/B-Hooks-OP-Check-EntersubForCV-0.09.tar.gz' '0001-Perl-5.21.4-compatibility.patch')
md5sums=('5eb9a1c6038acf0a6da0a28f25c862f1'
         '7219b0df8fbc452253bf15717c5684ed') 

_distdir="B-Hooks-OP-Check-EntersubForCV-0.09"
build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    patch -Np1 -i ../0001-Perl-5.21.4-compatibility.patch
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
