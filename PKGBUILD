# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-rdf-ns'
pkgver='20130402'
pkgrel='1'
pkgdesc="Just use popular RDF namespace prefixes from prefix.cc"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-sharedir>=1.00')
makedepends=('perl-file-sharedir-install>=0.03')
url='http://search.cpan.org/dist/RDF-NS'
source=('http://search.cpan.org/CPAN/authors/id/V/VO/VOJ/RDF-NS-20130402.tar.gz')
md5sums=('405ff1ba5484619bb3301ece110622f5')
sha512sums=('1f375e3e777caa39a7a23a114438781989a6f41baa4f691c814ce546ae929dcc168bf2221dad59db0a71b035f459aa1806086100c72ecdda15f6a0b577684b7a')
_distdir="RDF-NS-20130402"

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
