# Contributor: Dirk Langer <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-domain-tld'
pkgver='1.75'
pkgrel='1'
pkgdesc="Work with TLD names"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Net-Domain-TLD'
source=("http://search.cpan.org/CPAN/authors/id/A/AL/ALEXP/Net-Domain-TLD-$pkgver.tar.gz")
md5sums=('d661c3d8fa1080bf7d75ca049d9f4a8e')
sha512sums=('88b090f427e7fccd8394059b643f260a83fe9ec3fd6741972ec388325bb8c178d9d89fc8da9b1338441972e6744117c4effe3551c2c3f95d52022496667fa4f1')
_distdir="Net-Domain-TLD-$pkgver"

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
