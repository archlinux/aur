# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-pdf'
pkgver='0.31'
pkgrel='1'
pkgdesc="Perl/CPAN Module Text::PDF: Module for manipulating PDF files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Text-PDF'
source=('http://search.cpan.org/CPAN/authors/id/B/BH/BHALLISSY/Text-PDF-0.31.tar.gz')
md5sums=('bf63812e65f2e2012e10e422a637760a')
sha512sums=('6413bddaefbb57918763d395b9c751ad630a2095970c2c1febb01235343339fd4eae2820a30b449775d95071cca000a0f11e955fe304c2c56a45e80b384308d5')
_distdir="Text-PDF-0.31"

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
