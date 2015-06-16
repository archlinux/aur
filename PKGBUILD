# Contributor: John D Jones III <jnbek1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-rpc-xml'
pkgver='0.78'
pkgrel='2'
pkgdesc="A set of classes for core data, message and XML handling"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-parser>=2.31' 'perl-libwww' 'perl-xml-libxml' 'perl-net-server')
makedepends=()
url='http://search.mcpan.org/dist/RPC-XML'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJRAY/RPC-XML-0.78.tar.gz')
md5sums=('6a4519dbc5130d872c13a7a23309f36b')
sha512sums=('160c5e699d3de78fe61a2d7a307e094261054cc4936d2b909fd0d29af77ca57aa76cd62f421a714c39feb1b46f1d81b9561551884dfb7e4dc6ab560c8e3e2822')
_distdir="RPC-XML-0.78"

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
