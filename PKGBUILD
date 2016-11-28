# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-tokenizer'
pkgver='0.05'
pkgrel='1'
pkgdesc="A tiny Perl code tokenizer."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser')
makedepends=()
url='https://metacpan.org/release/Perl-Tokenizer'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Perl-Tokenizer-$pkgver.tar.gz")
md5sums=('b5ef77b951f6c04cf035951ddeb10a89')
sha512sums=('6384abc2d90e2daa91a9114a0855851fd8cb8d0f3fec04ca87a69fe3352380c0c43f4c7c0aeefb2820bd65d4d289a921ff33d4f6e1710198dfdbd2c9370b1fb5')
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
