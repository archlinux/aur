# Maintainer: Amish <contact at via dot aur>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname=perl-encode-detect
pkgver=1.01
pkgrel=4
pkgdesc="An Encode::Encoding subclass that detects the encoding of data"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-module-build')
url='https://metacpan.org/pod/Encode::Detect'
source=("https://cpan.metacpan.org/authors/id/J/JG/JGMYERS/Encode-Detect-${pkgver}.tar.gz")
md5sums=('ee9faf55d7105c97b02b8ebe590819c7')
sha512sums=('cc9c81f716dcb61abb321abd84e4ebb95a674d9aa34c4265f58cace38f6d15ef4f2b8338190ae7d200672e047b795a30ce6155f9c1b1c424e25d962579b96224')
_distdir="Encode-Detect-${pkgver}"

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
