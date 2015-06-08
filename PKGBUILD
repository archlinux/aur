# CPAN Name  : utf8-all
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-utf8-all'
pkgver='0.015'
pkgrel='1'
pkgdesc="turn on Unicode - all of it"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-import-into>=0')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-warn>=0')
url='http://search.cpan.org/dist/utf8-all'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOHERTY/utf8-all-0.015.tar.gz')
md5sums=('656b68076393901f4a6b1901cc17b96b')
sha512sums=('828b847ea50627cfcc8a9310f0a4c27bd5b2e0a59623142fe541e3b0910f5ce4829a46bc467d62c45822c220091fc37b9f4e615bc3baa416640cf381dd7fb0bd')
_distdir="utf8-all-0.015"

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
