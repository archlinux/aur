# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-memoize-expirelru'
pkgver='0.56'
pkgrel='1'
pkgdesc="Perl/CPAN Module Memoize::ExpireLRU: Expiry plug-in for Memoize that adds LRU cache expiration"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Memoize-ExpireLRU'
source=("http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Memoize-ExpireLRU-${pkgver}.tar.gz")
md5sums=('8a8c66e450dfddea7cb9b5a20c94390d')
sha512sums=('4f19b3149b3ebd2fc7be9320e6bfe60220462dd8ca4a45d2aa22cf938ae763d80c51401ce73309da50c59194559637660432c6630c00846793c7114f8ac00eed')
_distdir="Memoize-ExpireLRU-${pkgver}"

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
