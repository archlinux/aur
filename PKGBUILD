# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dirdb-storable'
pkgver='0.07'
pkgrel='1'
pkgdesc="DirDB extended to pass complex things to Storable"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/DirDB-Storable'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAVIDNICO/DirDB/DirDB-Storable-0.07.tar.gz')
md5sums=('b037e2bec449d8abf1a4c424ddd14aa5')
sha512sums=('dd5c1c6e937d8f1e2b388e216a3beeb74c130340e424cba5ed792fc2753bf3363b039558b2906aec64200923605c7453816442b104c1a986a35c3d003c969519')
_distdir="DirDB-Storable-0.07"

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
