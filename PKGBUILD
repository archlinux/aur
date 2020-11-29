# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-tie-toobject'
pkgver='0.03'
pkgrel='3'
pkgdesc="Perl/CPan Module: Tie to an existing object."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Tie-ToObject'
source=("http://search.cpan.org/CPAN/authors/id/N/NU/NUFFIN/Tie-ToObject-$pkgver.tar.gz")
md5sums=('b4f434992c286d531f26893c78541456')
sha512sums=('b3d2060d35e943e9aae28159ec71c7a6f01f47aa2905f5a218fafda8b1eb9e9da52038471617effe9f513f882b02e59946ddddf522058221b9132970e78ec94f')
_distdir="Tie-ToObject-$pkgver"

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

  find "$pkgdir" "("  -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
