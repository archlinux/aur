# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-perl-tokenizer'
pkgver='0.11'
pkgrel='1'
pkgdesc="Perl::Tokenizer - a tiny Perl code tokenizer."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser')
makedepends=()
url='https://metacpan.org/release/Perl-Tokenizer'
source=("https://cpan.metacpan.org/authors/id/T/TR/TRIZEN/Perl-Tokenizer-$pkgver.tar.gz")
b2sums=('6eee7252d09e182f20bd1e720fd02e5d1119f58776551d2ee0ccf3ae51bcd2aabbd4d5a20c2d90907ba2d263c0a33c48983596075beb7b2cfa30537c2d06c021')
_distdir="Perl-Tokenizer-$pkgver"

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
  rm -r "$pkgdir/usr/lib"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
