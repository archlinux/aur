# Contributor: Ordoban <gabba.head@gmx.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-critic-itch'
pkgver='0.07'
pkgrel='1'
pkgdesc="Perl::Critic::Itch - A collection of Policies to solve some Itches"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-perl-critic>=1.052')
makedepends=()
url='https://metacpan.org/release/Perl-Critic-Itch'
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MARCELO/Perl-Critic-Itch-$pkgver.tar.gz")
md5sums=('e4844a86af93478f8e13da39b4d54833')
sha512sums=('f96de92296956c6e448988b6f10c7a560bf977a63180b048a4acf7aaa2259d2bdd43eb7e887056a6ca671be89cb587a12c2db495a5835f77f329808c405586a9')
_distdir="Perl-Critic-Itch-$pkgver"

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
