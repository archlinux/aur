# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-tiny'
pkgver='1.006'
pkgrel='1'
pkgdesc="Minimalist class construction"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Class-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Class-Tiny-1.006.tar.gz')
md5sums=('fa905646a85a1478b2db1fc9113cb6ac')
sha512sums=('0a6ca0b99bd10a39445bb582bcf89f3668747f05b13b1f7271e934a73781c855a0418ae19a41593c64288b74710f49c1dcda0005be4edf9965e8020139ca0c7e')
_distdir="Class-Tiny-1.006"

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
