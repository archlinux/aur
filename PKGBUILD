# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-minion'
pkgver='5.08'
pkgrel='1'
pkgdesc="Job queue"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=6.0' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Minion'
source=('http://search.cpan.org/CPAN/authors/id/S/SR/SRI/Minion-5.08.tar.gz')
md5sums=('b3e069ed5beaac0b3114e31e767185eb')
sha512sums=('8fbb94b9f7e959fa2c6de5ccca98e8843577db81acc4c7816b7126b1871198426169479c4da42a62eb7b0af477b0fc2865dc782435d1d078e0bcb229221ba6a8')
_distdir="Minion-5.08"

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
