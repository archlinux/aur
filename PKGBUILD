# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mime-ecoencode'
pkgver='0.95'
pkgrel='1'
pkgdesc="MIME Encoding (Economical)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/MIME-EcoEncode'
source=('https://cpan.metacpan.org/authors/id/M/MU/MURATAYA/MIME-EcoEncode-0.95.tar.gz')
md5sums=('4cb6d18f2877fd01f3a450dd22e840e8')
sha512sums=('46149ed3cba40cfb0f47a878051c3a5dd5bf711f75848dbb178a87aab883db584c21019e88d71bcfddfeaf2c0426a89062fa0cd668bbf4a196f2226adfc8a1e2')
_distdir="MIME-EcoEncode-0.95"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
