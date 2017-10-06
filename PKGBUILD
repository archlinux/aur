# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pdf-api2-simple'
pkgver='1.1.4'
pkgrel='1'
pkgdesc="Perl/CPAN Module PDF::API2::Simple: Simplistic wrapper for the excellent PDF::API2 modules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-pdf-api2')
makedepends=('perl-module-install')
url='https://metacpan.org/release/PDF-API2-Simple'
source=('http://search.cpan.org/CPAN/authors/id/R/RE/REDTREE/PDF-API2-Simple-1.1.4u.tar.gz')
md5sums=('e2c4f5d8eb4ad775f6ca8816cbf45d12')
sha512sums=('8db8ede9044ac25dd74b79cb6046b53dada09ee64b6ffedec5d8f8d952ff71b655e1c4d901555cb55970492535160eed37e33d4a28cc99266ab607a8f3589b07')
_distdir="PDF-API2-Simple-1.1.4"

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
