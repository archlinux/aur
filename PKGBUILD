# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pquery'
pkgver='0.23'
pkgrel='1'
pkgdesc="A port of jQuery.js to Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-tree')
makedepends=()
url='https://metacpan.org/release/pQuery'
source=('http://search.cpan.org/CPAN/authors/id/I/IN/INGY/pQuery-0.23.tar.gz')
md5sums=('8c7e4d1fcaadc6f07c57cf3ec3255421')
sha512sums=('92e8889026eb4dffa2c68fb7bf8dd165f423bd98aa23258a71b6a50ebe29258822ada454ee4545f6ddcfdefe0447efdeaa8a4e4e7d2501d000c27ad1ca0b2305')
_distdir="pQuery-0.23"

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
