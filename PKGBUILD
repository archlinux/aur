# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-path-finddev'
pkgver='0.5.3'
pkgrel='1'
pkgdesc="Find a development path somewhere in an upper hierarchy."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-tiny>=0.010' 'perl-path-isdev>=0.2.2' 'perl-path-tiny>=0.054' 'perl-sub-exporter')
makedepends=()
url='https://metacpan.org/release/Path-FindDev'
source=('https://cpan.metacpan.org/authors/id/K/KE/KENTNL/Path-FindDev-v0.5.3.tar.gz')
md5sums=('590bf126fe33ebb34bb72e747dce371e')
sha512sums=('dd7a6a05f9e21c45a5ef25b3e2598a8f769a2ab3ef24ddb8e918b17a0f025bc5ba5b23fecf832911b7003de6cdaceb0e4a8c1139b4e23b080920739604e37bf6')
_distdir="Path-FindDev-v0.5.3"

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
