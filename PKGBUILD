# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-tokenizer'
pkgver='0.10'
pkgrel='1'
pkgdesc="A tiny Perl code tokenizer."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser')
makedepends=()
url='https://metacpan.org/release/Perl-Tokenizer'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Perl-Tokenizer-$pkgver.tar.gz")
md5sums=('3c6486e60117bd225f3acc36a373d46e')
sha512sums=('9d2cb284e2e921a1d1e3bdaf0d27a7705355fd5341c4d03bb027f6f92bc8f3d6252b775f59d8e09a9056a77c0b5dc67161d9e475988ee90f114259f1a4291711')
_distdir="Perl-Tokenizer-$pkgver"

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
