# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pquery'
pkgver='0.24'
pkgrel='1'
pkgdesc="A port of jQuery.js to Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-tree' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/pQuery'
source=('http://search.cpan.org/CPAN/authors/id/I/IN/INGY/pQuery-0.24.tar.gz')
md5sums=('40707f93a016d7164155ea84d5d0dea0')
sha512sums=('225a23e4ff118d73c95f15f3bb2d6df8d97f48c5f8f85026756efd6ea3df66074265dbfbeb673fec2e44fa8e44efae28aa52f62bc80d867cd2c7763e5fa97727')
_distdir="pQuery-0.24"

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
