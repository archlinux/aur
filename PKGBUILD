# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-printer'
pkgver='0.39'
pkgrel='1'
pkgdesc="colored pretty-print of Perl data structures and objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone-pp' 'perl-file-homedir>=0.91' 'perl-package-stash>=0.3' 'perl-sort-naturally')
makedepends=()
url='https://metacpan.org/release/Data-Printer'
source=('http://search.cpan.org/CPAN/authors/id/G/GA/GARU/Data-Printer-0.39.tar.gz')
md5sums=('886abbb9bae5363eca16b5728732f659')
sha512sums=('4110f4a8c0f1516df14e418ba4b5b2b6a30790cbf838f81a9dec862f62355cf3035f482ccd0d118bb3d16f28dd381d518c23d65b95d045444438b9721062eb9c')
_distdir="Data-Printer-0.39"

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
