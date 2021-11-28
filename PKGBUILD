# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mce'
pkgver='1.875'
pkgrel='1'
pkgdesc="Many-Core Engine for Perl providing parallel processing capabilities"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/MCE'
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MARIOROY/MCE-${pkgver}.tar.gz")
md5sums=('c20e7c5929edfb56a8468d9d7fc20326')
sha512sums=('e9c4f56778394036b414103ab65b03df50146434a905dbb384d7b3518828c8a82e8c6ea433a9ed53da39c57c855214a800fd320ff8e89acde606b77e3b7276b8')
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
