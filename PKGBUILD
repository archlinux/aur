# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cpan-distnameinfo'
pkgver='0.12_01'
pkgrel='3'
pkgdesc="Extract distribution name and version from a distribution filename"
arch=('any')
license=('Artistic-1.0-Perl')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/CPAN-DistnameInfo'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/CPAN-DistnameInfo-0.12_01.tar.gz')
md5sums=('e90b6b9f418d6b7b16174e683104351e')
sha512sums=('b2cc9a201e41721a4abe6e117ef2bff4835397855ecff5f86bbbc703816cebc2114010c909b16cd3659d07b7db6b5efbde6f5f3627c4e8c776ff07b37ead1b3b')
_distdir="CPAN-DistnameInfo-0.12_01"

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
