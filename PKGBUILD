# CPAN Name  : DateTime-Format-Epoch
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-datetime-format-epoch'
pkgver='0.16'
pkgrel='1'
pkgdesc="Convert DateTimes to/from epoch seconds"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-datetime>=0.31' 'perl-params-validate>=0')
makedepends=()
url='https://metacpan.org/release/DateTime-Format-Epoch'
source=('http://search.cpan.org/CPAN/authors/id/C/CH/CHORNY/DateTime-Format-Epoch-0.16.tar.gz')
md5sums=('856d6048f42724f49835fb96f66bab3d')
sha512sums=('61667e07eb5ae0d93ac37a84816be3095ed880d8c4e28ba6cd5f700723de6750f70a8ed00027dfe7cb6a8b7798c8b381a0f1f3dee03cef343a010255aed0c345')
_distdir="DateTime-Format-Epoch-0.16"

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
