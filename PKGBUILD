# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-string-truncate'
pkgver='1.100602'
pkgrel='1'
pkgdesc="a module for when strings are too long to be displayed in..."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter>=0.953' 'perl-sub-install>=0.03')
makedepends=()
url='https://metacpan.org/release/String-Truncate'
source=('https://cpan.metacpan.org/authors/id/R/RJ/RJBS/String-Truncate-1.100602.tar.gz')
md5sums=('77cfc678607a7d84008b117f3991bbfa')
sha512sums=('67519f7c4e3b5b7021b71d70468e3b74b0a60b09cf32988bdf0058a10ee4bec80b189ee33f7c2bc67db804d92ceddaac11feb2f39c7f8b941b12f52eee47b90e')
_distdir="String-Truncate-1.100602"

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
