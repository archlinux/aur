# Maintainer : Justin Vreeland <vreeland.justin at gmail dot com>
# Former:
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-type-tiny'
pkgver='1.002001'
pkgrel='1'
pkgdesc="tiny, yet Moo(se)-compatible type constraint"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exporter-tiny>=0.026' 'perl>=5.6.1')
makedepends=()
url='http://search.cpan.org/dist/Type-Tiny'
source=("http://www.cpan.org/authors/id/T/TO/TOBYINK/Type-Tiny-${pkgver}.tar.gz")
sha512sums=('e499c4f113e5a327294012daac9f0cd60a42a6c40b9d0c9c523a229f574a7dd0f672f209d0596d25edcbc39b79cd2ea65791b6a5146345e75fdd1d84ee1cd161')
_distdir="Type-Tiny-${pkgver}"

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
