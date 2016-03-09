# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-config-autoconf'
pkgver='0.311'
pkgrel='1'
pkgdesc="A module to implement some of AutoConf macros in pure perl."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny')
makedepends=('bison' 'flex' 'gawk' 'grep' 'pkg-config' 'sed')
url='https://metacpan.org/release/Config-AutoConf'
source=('http://search.cpan.org/CPAN/authors/id/R/RE/REHSACK/Config-AutoConf-0.311.tar.gz')
md5sums=('fa19f46bbd5bb0bd23ee41e8fd7b533f')
sha512sums=('36ab86fdf2ede03c3e5dc0ba77a80ac19441aeaed2d51a1469d14f8c433fb0908f938d0d33d9e9fd34b978f97b96481596fa3c4c49a7d2960c8132d2f4cd5e20')
_distdir="Config-AutoConf-0.311"

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
