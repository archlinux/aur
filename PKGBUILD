# Maintainer: Maxim Polishchuk <mpolishchuck@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-module-reader'
pkgver='0.003003'
pkgrel='1'
pkgdesc="Read the source of a module like perl does"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Module-Reader'
source=('http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/Module-Reader-0.003003.tar.gz')
md5sums=('d0e005053574bbf79207f2d3a3c54604')
sha512sums=('e1c20a970f0869d92d9e8af05d0fde3f824d0632b29be410b87bcac6dbf50b06a784ef9b356ec896764c4ce2d0b886e55a6a89aa51fd272b16de40f1d2989ce5')
_distdir="Module-Reader-0.003003"

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
