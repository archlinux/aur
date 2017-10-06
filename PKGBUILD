# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pdf-reuse'
pkgver='0.39'
pkgrel='1'
pkgdesc="Perl/CPAN Module PDF::Reuse: Reuse and mass produce PDF documents"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-font-ttf' 'perl-text-pdf')
makedepends=()
url='https://metacpan.org/release/PDF-Reuse'
source=('http://search.cpan.org/CPAN/authors/id/C/CN/CNIGHS/PDF-Reuse-0.39.tar.gz')
md5sums=('2a4d8a2f82ef07a40f8c8bc946f988c6')
sha512sums=('b9c570788990a5e21963577b2227e0a0d50ab7be87c7fa1bfcf2d6ff994c12a260fe6777eaf4ff95447e18d2ccaee6f55813df29aa4c205ddbe89529e9f9b60c')
_distdir="PDF-Reuse-0.39"

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
