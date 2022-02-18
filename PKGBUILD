# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbix-util-schema'
pkgver='0.002'
pkgrel='1'
pkgdesc="Utility routines related to database schema"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbd-sqlite>=0' 'perl-dbi>=0' 'perl-file-chdir>=0' 'perl-log-ger>=0.037' 'perl>=5.10.1')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/DBIx-Util-Schema'
source=("https://cpan.metacpan.org/authors/id/P/PE/PERLANCAR/DBIx-Util-Schema-$pkgver.tar.gz")
md5sums=('caeebab4ef9f906bf62719b8c0d081bc')
sha512sums=('2789583ff2f50b85caf206e3f1a9c4e1f744e6ab31e4ade326cb9bd19d1926361d062c1684a04926178976657775f1866354ae33c953bab805825d2497c7efc2')
_distdir="DBIx-Util-Schema-$pkgver"

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
