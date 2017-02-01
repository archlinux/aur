# Maintainer: archlinux.info:tdy
# Generator: CPANPLUS::Dist::Arch 1.32

pkgname='perl-statistics-basic'
pkgver='1.6611'
pkgrel='1'
pkgdesc="A collection of very basic statistics modules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-number-format>=1.42' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Statistics-Basic'
source=('http://search.cpan.org/CPAN/authors/id/J/JE/JETTERO/Statistics-Basic-1.6611.tar.gz')
md5sums=('1ee961c3a4b9c0a594dc3cfccbcd1ed1')
sha512sums=('10d726f9ace2a78753ec6cd91bd2c7cc7958eac11de762c3f4deff1a90e0837269484b7adc2ba22f3de128c3bf3a626cb70a9fd752a3eff5fd60db52cb7a7d68')
_distdir="Statistics-Basic-1.6611"

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
