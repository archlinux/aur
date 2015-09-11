# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-hash-merge-simple'
pkgver='0.051'
pkgrel='1'
pkgdesc="Recursively merge two or more hashes, simply"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone>=0')
makedepends=()
checkdepends=('perl-test-most>=0')
url='http://search.cpan.org/dist/Hash-Merge-Simple'
source=('http://search.cpan.org/CPAN/authors/id/R/RO/ROKR/Hash-Merge-Simple-0.051.tar.gz')
md5sums=('f47b9b99794b1f958bcfa3e816ff4660')
sha512sums=('8db850144593632ce8ac8a560dac6670814a9ce3d1091d6aa42ab0eadca4b350671103b1de906d562aeaa0934fd58bd4e557821c5bcd730a10849f8505f65c4c')
_distdir="Hash-Merge-Simple-0.051"

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
