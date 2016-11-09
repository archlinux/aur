# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-file-monitor-lite'
pkgver='0.652003'
pkgrel='1'
pkgdesc="Monitor file changes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0' 'perl-file-find-rule>=0' 'perl-file-monitor>=0' 'perl-file-touch>=0')
makedepends=()
url='https://metacpan.org/release/File-Monitor-Lite'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DRYMAN/File-Monitor-Lite-0.652003.tar.gz')
md5sums=('f16a90d0bc1287e323a02183227232c7')
sha512sums=('78a2aa47d7a3900c47798d2e129dd2384d345cdd5d3d5c67dc2a44d8ebf7b49f44ea880379c351917c225f5ad6c56d0a1db50fd11eac3db9fa5d4af2f6564a69')
_distdir="File-Monitor-Lite-0.652003"

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
