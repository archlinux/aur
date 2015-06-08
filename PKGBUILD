# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-microformats'
pkgver='0.105'
pkgrel='1'
pkgdesc="parse microformats in HTML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010' 'perl-datetime' 'perl-datetime-format-builder' 'perl-datetime-format-natural' 'perl-datetime-format-strptime' 'perl-datetime-set' 'perl-html-html5-parser>=0.200' 'perl-html-html5-sanity>=0.100' 'perl-http-date' 'perl-json>=2.00' 'perl-rdf-trine>=0.130' 'perl-role-commons' 'perl-uri>=1.30' 'perl-xml-libxml>=1.60')
makedepends=()
url='http://search.cpan.org/dist/HTML-Microformats'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/HTML-Microformats-0.105.tar.gz')
md5sums=('1349c0326c3dbd6b23e25b115337af89')
sha512sums=('4563785ace9088fc87272e14953a953e06c3207d0dc96db0f64448905502f42183f1bded529de39600b01705700187f218df9ade19868d73b8221da1a02e1b5c')
_distdir="HTML-Microformats-0.105"

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
