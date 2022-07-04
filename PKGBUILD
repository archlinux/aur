# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mce'
pkgver='1.879'
pkgrel='1'
pkgdesc="Many-Core Engine for Perl providing parallel processing capabilities"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/MCE'
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MARIOROY/MCE-${pkgver}.tar.gz")
md5sums=('1fb046fb3d9a39e345a017ae12b7c482')
sha512sums=('665ef022394e2bc3a498fb1743f94ceee2ed77d3f5c344c49d5d1e1eefb7ace58899e42a69d24a5a17c2665e9ca7888f43b8c8951949b7f2eb1510ad4621a744')
_distdir="MCE-${pkgver}"

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
