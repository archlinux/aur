# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-regexp-trie'
pkgver='0.02'
pkgrel='2'
pkgdesc="builds trie-ized regexp"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Regexp-Trie'
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DANKOGAI/Regexp-Trie-${pkgver}.tar.gz")
md5sums=('6e3ecf25c359bce39f0acf261571e558')
sha512sums=('49aac4f9d49f71a2cf7111e549da0f3dfa77679d313080095188e8172e5fea0fdb256b8d784949716813d51c03fe9fdfe097e394bba34016fa61bd82c4c20995')
_distdir="Regexp-Trie-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
