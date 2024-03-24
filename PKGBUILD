# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-uri-imaps'
pkgver='1.04'
pkgrel='1'
pkgdesc="Support IMAPS URI"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-uri>=0')
makedepends=()
url='https://metacpan.org/release/URI-imaps'
source=('http://search.cpan.org/CPAN/authors/id/A/AL/ALEXM/URI-imaps-1.04.tar.gz')
md5sums=('9a3078af8930563af76736f66f1a8b89')
sha512sums=('d1559823e346131801dad0da45ae8e5c0d1ad0c09a9a9c70f958489cd598ba5ebf79e31424b461ee6e42ffdd2ac5fb02a3273200e8999e54b069d4e1cbbc2919')
_distdir="URI-imaps-1.04"

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
