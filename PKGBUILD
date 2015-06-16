# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-app-basis'
pkgver='1.0'
pkgrel='1'
pkgdesc="Basis for simple applications"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-homedir' 'perl-moo' 'perl-path-tiny' 'perl-try-tiny' 'perl-yaml-libyaml' 'perl>=5.014')
makedepends=()
url='http://search.mcpan.org/dist/App-Basis'
source=('http://search.mcpan.org/CPAN/authors/id/M/MO/MOODFARM/App-Basis-1.0.tar.gz')
md5sums=('4e370f079b9837601b516538dbe97357')
sha512sums=('fea71861fe61124e06eb47a8b0b66f38ec183e8c11b852d1121b26a740dbff849d71d7aa1efd3a7aad99679225839692374d93c7709d8d49ebb7fce0e24dc94a')
_distdir="App-Basis-1.0"

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
