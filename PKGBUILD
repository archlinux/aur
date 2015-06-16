# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-crypt-ciphersaber'
pkgver='1.00'
pkgrel='1'
pkgdesc="Perl module implementing CipherSaber encryption."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-warn')
url='http://search.cpan.org/dist/Crypt-CipherSaber'
source=('http://search.cpan.org/CPAN/authors/id/C/CH/CHROMATIC/Crypt-CipherSaber-1.00.tar.gz')
md5sums=('a00b3e2591cc5f880a110cc53a0b2c7b')
sha512sums=('a946e6bf34b25212321611d1a68134bb931046d2de9cb39ac4e6f8c79e25ac575b421ae6bb672a4a9c318ffc5ebca11569b6a38d60b303502edd01c7b8878439')
_distdir="Crypt-CipherSaber-1.00"

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
