# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-md5'
pkgver='2.03'
pkgrel='1'
pkgdesc="Perl interface to the MD5 Message-Digest Algorithm"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/MD5'
source=('http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/MD5-2.03.tar.gz')
md5sums=('0957f02fc30bc2106b3286ba854917bc')
sha512sums=('592a9c70f09cf2f3a3112d72e348d39c1522822dfd19f10b446eb83cdd0ab74c6609bd2a3609f4c7d32e7c08171be01940845f89f814621ddc608ce6d30bc0e9')
_distdir="MD5-2.03"

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
