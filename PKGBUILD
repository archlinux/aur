# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lingua-ispell'
pkgver='0.07'
pkgrel='1'
pkgdesc="Perl/CPAN Module Lingua::Ispell: A module encapsulating access to the Ispell program."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Lingua-Ispell'
source=("http://search.cpan.org/CPAN/authors/id/J/JD/JDPORTER/Lingua-Ispell-$pkgver.tar.gz")
md5sums=('8f6a364daccf28a5c208fa1a3df83daa')
sha512sums=('2c7b71115c5db5d3aa91126a36e80b94dac8771e81638fd9de8a561cebca64262e6596aed2ebee3ba131590f23ac8ddef3157db929c44d6333157ac209a9facc')
_distdir="Lingua-Ispell-$pkgver"

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
