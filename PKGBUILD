# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sys-mmap'
pkgver='0.17'
pkgrel='1'
pkgdesc="uses mmap to map in a file as a Perl variable"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Sys-Mmap'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/Sys-Mmap-0.17.tar.gz')
md5sums=('1fc827d67d468c594ab486c58047d57c')
sha512sums=('004d6160323bb185fe23295679dc0c1e8f2696ce3760c0ae6922e3a21ba7b5deb1893b2e65c5b83c6897060d589ed4bd6b5f3b703172f98a8ed57e99a0b2bad9')
_distdir="Sys-Mmap-0.17"

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
