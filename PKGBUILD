# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-minion'
pkgver='5.02'
pkgrel='1'
pkgdesc="Job queue"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=6.0' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Minion'
source=('http://search.cpan.org/CPAN/authors/id/S/SR/SRI/Minion-5.02.tar.gz')
md5sums=('c164564e9495bd9a2079acd55303528d')
sha512sums=('e0c9a7ef782e5e9a460c8a798bbef594999d8682dd60fc5b5f912849b06baf1e8fd5d2ef8f351231dcb7d3380f8bbb781f12d3d4e638708e6e15d46c95002775')
_distdir="Minion-5.02"

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
