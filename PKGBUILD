# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-sys-mmap'
pkgver='0.16'
pkgrel='1'
pkgdesc="uses mmap to map in a file as a Perl variable"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Sys-Mmap'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/Sys-Mmap-0.16.tar.gz')
md5sums=('faae869e876fa86f92e6de3f13af3aef')
sha512sums=('9f533f8eaa2707a77fa69dc0163e5e55b13d6653ddb5f7850c3fcaa090c79069cccedb947c1b8cd5a125fd7b055803eff437697c120785f422bff0414be7cd05')
_distdir="Sys-Mmap-0.16"

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
