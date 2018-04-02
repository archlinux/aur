# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-json-validator'
pkgver='2.05'
pkgrel='1'
pkgdesc="Perl/CPAN Module JSON::Validator: Validate data against a JSON schema"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=7.28')
makedepends=()
url='https://metacpan.org/release/JSON-Validator'
source=("http://search.cpan.org/CPAN/authors/id/J/JH/JHTHORSEN/JSON-Validator-$pkgver.tar.gz")
md5sums=('4121324dad031b0841eaa81023ab0de5')
sha512sums=('1d5a9dce328ec48b484f121e3394f552fe8edbb2fba6328fd5bbdd7371de399b542a34f0e40bafa82cb32d77fa3811ef7a5c715093e342a31d552f74219fd315')
_distdir="JSON-Validator-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
