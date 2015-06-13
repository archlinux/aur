# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-xml-simpleobject-libxml'
pkgver='0.60'
pkgrel="2"
pkgdesc="simple(r) object representation of an XML::LibXML DOM object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-xml-libxml')
url='http://search.cpan.org/dist/XML-SimpleObject-LibXML'
source=('http://search.cpan.org/CPAN/authors/id/D/DB/DBRIAN/XML-SimpleObject-LibXML-0.60.tar.gz')
md5sums=('6a722598b78a09fcfd35af804576fcd4')
sha512sums=('ae7a40e0aaf4db8ebf735842f20f6b8fae8ac1cf77dc74782e7f87e3f809ca1c83cea7052fd38345796440b1ce8351e69f8a2635b72cb9c9846fe618ecc2d70e')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/XML-SimpleObject-LibXML-0.60"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/XML-SimpleObject-LibXML-0.60"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "${srcdir}/XML-SimpleObject-LibXML-0.60"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
