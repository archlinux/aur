# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-tokenizer'
pkgver='0.07'
pkgrel='1'
pkgdesc="A tiny Perl code tokenizer."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser')
makedepends=()
url='https://metacpan.org/release/Perl-Tokenizer'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Perl-Tokenizer-$pkgver.tar.gz")
md5sums=('107f13b8088da8b050cfafa2da5693fa')
sha512sums=('6cf38b0c020dc6ce7056b770510203ed7fd04a83c72a73c5a8caf7aad11bdfbfc47e09420375d6f2dfd082e4d4b5d8b96344296cd0d781de6331e4e28a0cf790')
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
