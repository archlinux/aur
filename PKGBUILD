# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-devel-overloadinfo'
pkgver='0.004'
pkgrel='1'
pkgdesc="introspect overloaded operators"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mro-compat' 'perl-package-stash>=0.14' 'perl-sub-identify' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/Devel-OverloadInfo'
source=('http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/Devel-OverloadInfo-0.004.tar.gz')
md5sums=('97a27e31858b073daba54121d57be705')
sha512sums=('a8770f3319c8224d348fd28b1a057333e87d73b914c892d3c3581673db6fef8b5728a02a485eefc90edbc05899150cd8e172f464f0a4a29e8161815f6de8dcb1')
_distdir="Devel-OverloadInfo-0.004"

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
