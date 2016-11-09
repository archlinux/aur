# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-term-sk'
pkgver='0.18'
pkgrel='1'
pkgdesc="Perl extension for displaying a progress indicator on a terminal."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Term-Sk'
source=('http://search.cpan.org/CPAN/authors/id/K/KE/KEICHNER/Term-Sk-0.18.tar.gz')
md5sums=('18834e4acac7b766bc7f5d68a3dbff28')
sha512sums=('7ebaa2a884f480a75a6bf6ace37a4d3076671346f57c9ff091e814825fca5c2d98854e52dab1fdb811403c141c0f02b888821fff6cb19787c0cb876ce6aa07b1')
_distdir="Term-Sk-0.18"

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
