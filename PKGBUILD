# Contributor: Christos Nouskas <nous@archlinux.us>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-types-path-tiny'
pkgver='0.005'
pkgrel='1'
pkgdesc="Path::Tiny types and coercions for Moose and Moo"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-pushd>=0' 'perl-path-tiny>=0' 'perl-type-tiny>=0')
makedepends=()
url='https://metacpan.org/release/Types-Path-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Types-Path-Tiny-0.005.tar.gz')
md5sums=('94945f7f1a3be576c78bce82bfc89fa0')
sha512sums=('2e9f4694950bc9426d7b72e33234e594f4c2d4cc434526e3096b7a193cebdb2b4c4890b01637a1684e1d3ca67e355879bce5b79dcc69d14ff23f591ff193623e')
_distdir="Types-Path-Tiny-0.005"

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
