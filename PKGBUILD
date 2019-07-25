# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-pg'
pkgver='4.15'
pkgrel='1'
pkgdesc="Mojolicious ♥ PostgreSQL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbd-pg' 'perl-mojolicious>=7.53' 'perl-sql-abstract>=1.85' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Mojo-Pg'
source=("https://cpan.metacpan.org/authors/id/S/SR/SRI/Mojo-Pg-${pkgver}.tar.gz")
md5sums=('4c95a85ae24dde239139b2a43b0a56d1')
sha512sums=('abe5ef6e53a66060f251638017b7ea9749fb6b86d09d9f0128331b0fe0dc652f994a7232419fde92526d8de0e67cd4c6f0f5cf040e2065a7082e9eaa82f7775d')
_distdir="Mojo-Pg-${pkgver}"

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
