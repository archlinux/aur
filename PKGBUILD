# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-dmp'
pkgver='0.241'
pkgrel='1'
pkgdesc="Dump Perl data structures as Perl code"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-regexp-stringify>=0' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Data-Dmp'
source=("https://cpan.metacpan.org/authors/id/P/PE/PERLANCAR/Data-Dmp-$pkgver.tar.gz")
md5sums=('7ec8b60711f28912a2f87bcfff9ea997')
sha512sums=('0b45c3e91dcd6c40960aa69a4058544691a86917976682835da9eceb3a8677763a50b6f18244d13a03d8a3d4de1068b84943cdcb32187aaf90fd7cf9ce670d43')
_distdir="Data-Dmp-$pkgver"

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
