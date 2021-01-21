# Contributor: Dirk Langer <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-enumeration'
pkgver='0.010'
pkgrel='1'
pkgdesc="shortcuts for working with enum attributes in Moo"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moo>=1.006000' 'perl-type-tiny>=0' 'perl-match-simple>=0' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-fatal>=0')
url='https://metacpan.org/release/MooX-Enumeration'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/MooX-Enumeration-0.010.tar.gz')
md5sums=('031cc595c61c04d8c535f47d366ab2cb')
sha512sums=('2a02212bdf21429ab337b39ec2cd0d366e3b913334a43303fa43ee694b0f024e5aa7eccce89463f8427ac866325cd5eacd819eaf572f88a288a125681761e854')
_distdir="MooX-Enumeration-0.010"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
