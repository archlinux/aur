# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-clean'
pkgver='0.507'
pkgrel='1'
pkgdesc="Clean data structure"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone-pp>=0' 'perl-data-dmp>=0.240' 'perl-datetime>=0' 'perl-log-ger>=0.037' 'perl-string-linenumber>=0' 'perl-string-perlquote>=0' 'perl>=5.10.1')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/Data-Clean'
source=("https://cpan.metacpan.org/authors/id/P/PE/PERLANCAR/Data-Clean-$pkgver.tar.gz")
md5sums=('41b4fb86f145fa22ff7658d91e107597')
sha512sums=('1533f6f6f59090cd63f76c6dcd7e4e19e65da5f5cdf548fa0130a2e77a3ffa2e4bcb4a43ab621769499cd9dc010bb69901b78230494b1c18223b028ee759bae3')
_distdir="Data-Clean-$pkgver"

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
