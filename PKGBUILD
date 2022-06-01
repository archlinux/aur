# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-void'
pkgver='0.05'
pkgrel='2'
pkgdesc="A class that stringifies to nothing for whatever you do with it"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Class-Void'
source=("https://cpan.metacpan.org/authors/id/M/MA/MALTEU/Class-Void-$pkgver.tar.gz")
md5sums=('eab250dde65e7cd9e6ce5816566d9037')
sha512sums=('ff45a528840a1b19d752bd4672c03aa51293972b839e15a2b33c34df484c8a5bc232d6b699dfd12abe3b81fc5fdea538faad3c3611cb825a0dd0cbcfdff791a0')
_distdir="Class-Void-$pkgver"

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
  #make test
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
