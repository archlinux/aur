# Contributor: Dirk Langer <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moox-classattribute'
pkgver='0.011'
pkgrel='1'
pkgdesc="declare class attributes Moose-style... but without Moose"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exporter-tiny>=0' 'perl-moo>=1.000000' 'perl-role-tiny>=1.000000' 'perl>=5.8.0')
makedepends=()
url='https://metacpan.org/release/MooX-ClassAttribute'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/MooX-ClassAttribute-0.011.tar.gz')
md5sums=('9b33fc3cd692d163dbfd96316df34c1f')
sha512sums=('00c62ff1a065a21f761357969e94bd45b2320bfc79e125635b87a034b141aed756ebae789602afb01b3341f5be980a2a8348305cb6c726a8d6b6cee2e3af1ccf')
_distdir="MooX-ClassAttribute-0.011"

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
