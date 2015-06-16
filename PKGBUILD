# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-manual'
pkgver='5.9007'
pkgrel='1'
pkgdesc="The Catalyst developer's manual"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-Manual'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Catalyst-Manual-5.9007.tar.gz')
md5sums=('dd24ec95a064bab02c0ed0e4faf7a19e')
sha512sums=('37da1afee051f8a1a3089994bab7b07beb8e7cefbd530b4a11cc4a06dba64f4b4ea7e2bd61c97c7b5d237c1adc38a3b00e401104b5fe81edc0eeac199dd82640')
_distdir="Catalyst-Manual-5.9007"

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
