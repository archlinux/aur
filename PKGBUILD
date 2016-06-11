# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-tokenizer'
pkgver='0.04'
pkgrel='1'
pkgdesc="A tiny Perl code tokenizer."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser')
makedepends=()
url='https://metacpan.org/release/Perl-Tokenizer'
source=('http://search.cpan.org/CPAN/authors/id/T/TR/TRIZEN/Perl-Tokenizer-0.04.tar.gz')
md5sums=('61d337b6df1b3e5f3ebf08b3c6209750')
sha512sums=('cad39e39c4be3888873e06edd9cddcde220fe03572d8e57e52e04d4151f7a7aa0224af00f7f3014a8ec99520d9d2fdc15369fd49c1e6d10127ab6880fe7b24b5')
_distdir="Perl-Tokenizer-0.04"

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
