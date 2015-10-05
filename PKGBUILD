# Maintainer: Christoph Vigano <mail at cvigano dot de>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-cgi-formbuilder'
pkgver='3.09'
pkgrel='1'
pkgdesc="An extremely fast, reliable form generation and processing module"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=()
makedepends=()
checkdepends=('perl-cgi')
url='https://metacpan.org/release/CGI-FormBuilder'
source=('https://cpan.metacpan.org/authors/id/N/NW/NWIGER/CGI-FormBuilder-3.09.tgz')
md5sums=('11aa9bc8bb64f2c1f6139eb19b77b923')
sha512sums=('6907131de95ac0188a4a80e380fd81554bd9fb8d2566e961e5ff05a30e4498bccb157ecfdc77bdcd05427ebc5882caaea47b044aaaddae85f48231c0b7eef240')
_distdir="CGI-FormBuilder-3.09"

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
