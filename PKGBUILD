# Contributor: András Wacha <awacha@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-utils'
pkgver='1.11'
pkgrel='1'
pkgdesc="Useful mathematical functions not in Perl."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Math-Utils'
source=('http://search.cpan.org/CPAN/authors/id/J/JG/JGAMBLE/Math-Utils-1.11.tar.gz')
md5sums=('c9210ba57bf6a4290c717cdd8f399948')
sha512sums=('047cb1a1e4bc7794dba4bd2d50cc0092b6cd6f5bf4567a693a386009ab9b104c2b56e82cff98bd1e3567311e7e1438addb5e88a09157c075705a00ade349bf9f')
_distdir="Math-Utils-1.11"

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
