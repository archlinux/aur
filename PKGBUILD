# Contributor: John D Jones III <jnbek1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-autorole'
pkgver='0.04'
pkgrel='1'
pkgdesc="Compiletime OR runtime mixin of traits/roles/mixins/your-word-here."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/AutoRole'
source=('http://search.cpan.org/CPAN/authors/id/R/RH/RHANDOM/AutoRole-0.04.tar.gz')
md5sums=('7253e73e8872e482be2d98bf6242d535')
sha512sums=('791452feff9e85b4b9110617ef076682e761b0a1a98a5e7950b4e09e45c465cba648c0a332099ae53aecda75880aeb0555c93b9424f9ef86b23c7a9751bd25eb')
_distdir="AutoRole-0.04"

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
