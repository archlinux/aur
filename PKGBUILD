# Contributor: ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-dom58'
pkgver='2.000'
pkgrel='1'
pkgdesc="Minimalistic HTML/XML DOM parser with CSS selectors"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Mojo-DOM58'
source=('https://cpan.metacpan.org/authors/id/D/DB/DBOOK/Mojo-DOM58-2.000.tar.gz')
md5sums=('a2fb62034ce2b2cbcda84dd435f223c8')
sha512sums=('755c3e042fc805ddb1ec29d733739312dda0e8b850a598c59ba02f28365c7a5998e7bf3241bb58c8982e5af72ce53964621b524c00a2aece008c1d6dcd754719')
_distdir="Mojo-DOM58-2.000"

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
