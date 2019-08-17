# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Drathir <drathir87@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cryptx'
pkgver='0.064'
pkgrel='1'
pkgdesc="Cryptographic toolkit (self-contained, no external libraries needed)"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/CryptX'
source=("http://search.cpan.org/CPAN/authors/id/M/MI/MIK/CryptX-${pkgver}.tar.gz")
md5sums=('ac7a97118172350f4e331fcef9e0f72f')
sha512sums=('b153512d1036461de795cd40b71b55f32908ac84101079e3e62c2690736de102046fe1f66007c4b0af6ded797709e1f06934d171f349bf983d53a2f1ab1f0d1d')
_distdir="CryptX-${pkgver}"

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
