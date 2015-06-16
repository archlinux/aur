# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-log-any'
pkgver='1.032'
pkgrel='1'
pkgdesc="Bringing loggers and listeners together"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Log-Any'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Log-Any-1.032.tar.gz')
md5sums=('f4ddf4eaf28c2eb2f4b87d36a10c383d')
sha512sums=('e7539f402c30637cb5b3935b7967130c4ecadb0bfdc35252740ab9f626c0c7752323f0bc0eb3b0530458570a5710ac8d845e48b8ea8e0517dc10b41077ac5184')
_distdir="Log-Any-1.032"

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
