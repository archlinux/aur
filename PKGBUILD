# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-wordpress-xmlrpc'
pkgver='1.23'
pkgrel='1'
pkgdesc="api to wordpress xml rpc calls"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-leocharre-cli2>=0' 'perl-leocharre-debug>=0' 'perl-soap-lite>=0' 'perl-smart-comments>=0' 'perl-xmlrpc-lite>=0' 'perl-yaml>=0')
makedepends=()
url='http://search.cpan.org/dist/WordPress-XMLRPC'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEOCHARRE/WordPress-XMLRPC-1.23.tar.gz')
md5sums=('cdbf3f7002b2fb44e69895b805b3c24c')
sha512sums=('f1fcd73ac4550680f5e9591c716eb2322facdf235b8515de8dd1846693d372a20f3fe495838a6b847a7d46c57d8db27601c94b04e59e76fcb0830772e4f9ed2a')
_distdir="WordPress-XMLRPC-1.23"

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
