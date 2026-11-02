# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-markdown-simple'
pkgver='0.23'
pkgrel='1'
pkgdesc="Markdown to HTML"
arch=('i686' 'x86_64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-eshu>=0.10' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Markdown-Simple'
source=("http://search.cpan.org/CPAN/authors/id/L/LN/LNATION/Markdown-Simple-$pkgver.tar.gz")
md5sums=('4c1c60550b77c610402838146dada326')
sha512sums=('7239e0a8522ba8a069ee8e1d6d7bab59834c3cd8d94a40192d74fe39d68427bc44e1a1e959f8e367fbf179969ee353f30dfbdd0c8fca5ae56dc386181e6417ee')
_distdir="Markdown-Simple-$pkgver"

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
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
