# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious-plugin-authorization'
pkgver='1.05'
pkgrel='1'
pkgdesc="A plugin to make Authorization a bit easier"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.38' 'perl-mojolicious>=0')
makedepends=()
checkdepends=('perl-test-deep>=0.113' 'perl-test-exception>=0.32')
url='https://metacpan.org/release/Mojolicious-Plugin-Authorization'
source=("http://search.cpan.org/CPAN/authors/id/B/BY/BYTEROCK/Mojolicious-Plugin-Authorization-${pkgver}.tar.gz")
md5sums=('9c009599cf397e3eacf5d7cd0dec45b8')
sha512sums=('8fdee3e8305bdfe2a1b31770b124e768250c615525122a9ff063cb83fa7dabc0b90a61f0bc420ff68571dd082c005f0919f503803e1bded3181d3f1b5cc07422')
_distdir="Mojolicious-Plugin-Authorization-${pkgver}"

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
