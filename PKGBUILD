# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-file-dircompare'
pkgver='0.7'
pkgrel='1'
pkgdesc="Perl module to compare two directories using"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/File-DirCompare'
source=('http://search.cpan.org/CPAN/authors/id/G/GA/GAVINC/File-DirCompare-0.7.tar.gz')
md5sums=('1b83e9653811d036cc0f97584e0aff9e')
sha512sums=('f929296b580aed630c1fa9ce177e835fc1110ec06c9fa3994f66e6dde4a7f253e80237dcafbfda1268bcb4e6abbca6147cc2e5a1317b1a1a3009086033463bc8')
_distdir="File-DirCompare-0.7"

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
