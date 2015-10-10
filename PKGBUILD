# Maintainer: Maxim Polishchuck <mpolishchuck@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-module-reader'
pkgver='0.002003'
pkgrel='2'
pkgdesc="Read the source of a module like perl does"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Module-Reader'
source=('http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/Module-Reader-0.002003.tar.gz')
md5sums=('6eec99e9c5df63a536bdc19aeeba23a2')
sha512sums=('d96c235c11094b1a4a96d317064ed168e79bdc519076a8c62017f6e4da8cbacf008f4615ca86a1067c8338e1d090605c65e7c6badb311531517dad0cbc40b35d')
_distdir="Module-Reader-0.002003"

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
