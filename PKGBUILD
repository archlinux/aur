# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-locale-currency-format'
pkgver='1.35'
pkgrel='1'
pkgdesc="Perl/CPAN Module Locale::Currency::Format: Perl functions for formatting monetary values"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Locale-Currency-Format'
source=('http://search.cpan.org/CPAN/authors/id/T/TN/TNGUYEN/Locale-Currency-Format-1.35.tar.gz')
md5sums=('3eb24b6459a3a3f6201773c4cbac2b32')
sha512sums=('fce9a107e7efbff39f853ff7937a934300cc85ddd81a5bdb1e0c18dc49e6b21d1312652a5c939962c05f3402d25ba4ed69feaeb97588183685e755243666e8c6')
_distdir="Locale-Currency-Format-1.35"

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
