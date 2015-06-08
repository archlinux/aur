# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-rpc'
pkgver='0.9'
pkgrel='1'
pkgdesc="Pure Perl implementation for an XML-RPC client and server"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww' 'perl-xml-treepp')
makedepends=()
url='http://search.cpan.org/dist/XML-RPC'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAAN/XML-RPC-0.9.tar.gz')
md5sums=('0bc3ed419b93eb08a5c3ee30cfea92b0')
sha512sums=('e02be983e2a691563d5b77d6018bbcc41271aeb702e24f8d6f81286e7fc339c44494e1efd47bcc283ee586da1508d1954a9ff1e67d91bf9151b0ab4e393268fc')
_distdir="XML-RPC-0.9"

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
