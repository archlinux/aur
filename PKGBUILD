# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pdf-writer'
pkgver='0.06'
pkgrel='1'
pkgdesc="Perl/CPAN Module PDF::Writer: PDF writer abstraction layer"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.0')
makedepends=()
url='https://metacpan.org/release/PDF-Writer'
source=("http://search.cpan.org/CPAN/authors/id/R/RK/RKINYON/PDF-Writer-$pkgver.tar.gz")
md5sums=('06fc558ac8654c71517f2a210462ba0a')
sha512sums=('262d6caf8aba83bac7fa13014722b7cc190bf2af2f33a927d501e7c687a5db08d419e61c66c88a37e9056c5d012f1f2191ebdb5157bc9ad4970c67e1ef933a3f')
_distdir="PDF-Writer-$pkgver"

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
