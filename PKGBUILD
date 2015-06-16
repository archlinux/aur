# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-perl6-export-attrs'
pkgver='0.0.3'
pkgrel='1'
pkgdesc="The Perl 6 'is export(...)' trait as a Perl 5 attribute"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Perl6-Export-Attrs'
source=('http://search.cpan.org/CPAN/authors/id/D/DC/DCONWAY/Perl6-Export-Attrs-0.0.3.tar.gz')
md5sums=('c8af78c4fec3351178d1de59cc9c8869')
sha512sums=('f722a54c1f95a48c60151106cae8bbeeb2532d18cde1b6ac6b7f2f3d2c0232aae687c4cd79f3a7682090e300bc11e95dec4998a17aa38eac0aa2cee22eea3304')
_distdir="Perl6-Export-Attrs-0.0.3"

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
