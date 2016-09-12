# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl6-export-attrs'
pkgver='0.000005'
pkgrel='1'
pkgdesc="The Perl 6 'is export(...)' trait as a Perl 5 attribute"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-padwalker')
makedepends=()
url='https://metacpan.org/release/Perl6-Export-Attrs'
source=('http://search.cpan.org/CPAN/authors/id/D/DC/DCONWAY/Perl6-Export-Attrs-0.000005.tar.gz')
md5sums=('aeb0ca750ae349937fff127aacdfb89d')
sha512sums=('4b9bf7949f630b8dcf5096fbbdd641811e694222a962ce97513ecbe618a1512b8fddbadcae4069a4c7e5a1dc96fa441ca3ad0c88cb2ddfb2a54e23d141833edc')
_distdir="Perl6-Export-Attrs-0.000005"

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
