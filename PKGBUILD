# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-minion'
pkgver='5.03'
pkgrel='1'
pkgdesc="Job queue"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=6.0' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Minion'
source=('http://search.cpan.org/CPAN/authors/id/S/SR/SRI/Minion-5.03.tar.gz')
md5sums=('9d75f622158ac242d79fcb735a6ccf3a')
sha512sums=('42ee2980820d60342afb1dd3ef0e02f5f8064fa36164f422c6625e7358798ed6365743cbb68f0d591dd77aed02a7364a45a9a4126e59de84e9c1eb4b71c437f0')
_distdir="Minion-5.03"

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
