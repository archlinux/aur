# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-config-autoconf'
pkgver='0.310'
pkgrel='1'
pkgdesc="A module to implement some of AutoConf macros in pure perl."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny')
makedepends=('sed' 'gawk' 'grep' 'bison' 'pkg-config' 'flex')
url='http://search.mcpan.org/dist/Config-AutoConf'
source=('http://search.mcpan.org/CPAN/authors/id/R/RE/REHSACK/Config-AutoConf-0.310.tar.gz')
md5sums=('456749ec964dceb5ae405650bc6e4f1c')
sha512sums=('c4d3dfdf908663a0917d5a51b581119696444ab3987fdb8cc5ef942f11b47f1063f7ff133b308fc3d7d0a0ed53e2186d9a7a1d2148208b140a8cb005d20cbae2')
_distdir="Config-AutoConf-0.310"

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
