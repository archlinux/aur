# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-midi-perl'
pkgver='0.84'
pkgrel='1'
pkgdesc="read, compose, modify, and write MIDI files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/MIDI-Perl'
source=('https://cpan.metacpan.org/authors/id/C/CO/CONKLIN/MIDI-Perl-0.84.tar.gz')
md5sums=('b1d7f7b428627739e935b713e3cec5af')
sha512sums=('e05fdcd153feb4c848166fb352a9e524bdb68716ba1fc89dde35136b4503157dd4cfd35053bdf89e3c320baa9ffa632b1c1237f03461bc854de073c1b953541c')
_distdir="MIDI-Perl-0.84"

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
