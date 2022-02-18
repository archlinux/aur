# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbix-diff-schema'
pkgver='0.097'
pkgrel='1'
pkgdesc="Compare schema of two DBI databases"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbd-sqlite>=0' 'perl-dbi>=0' 'perl-dbix-util-schema>=0' 'perl-file-chdir>=0' 'perl-log-ger>=0.037' 'perl-scalar-util-numeric>=0' 'perl>=5.10.1')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/DBIx-Diff-Schema'
source=("https://cpan.metacpan.org/authors/id/P/PE/PERLANCAR/DBIx-Diff-Schema-$pkgver.tar.gz")
md5sums=('63161cbeb8d30d2c8686436b651fa29f')
sha512sums=('334608b0b128809e52737a7389880b0f8baa8f8d504c972f6ff277504bad23892b89d654c1016bad7055754411234a273b3e4239e7b5a93cab7a2e77ac0f5f14')
_distdir="DBIx-Diff-Schema-$pkgver"

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
