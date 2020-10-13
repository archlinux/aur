# Contributor: Marc Cousin <cousinmarc@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-types'
pkgver='0.17'
pkgrel='1'
pkgdesc="Validate and convert data types."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Data-Types'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MANWAR/Data-Types-0.17.tar.gz')
md5sums=('80b45023dd76c9dcb8f53eee9f40df9d')
sha512sums=('4e496005f744251365fe43719b00ba89fe5135e04c737b166247bc0b60955b62ddc381d0e837a958aca51b0c4699c2d51a2d02901a4368fb60a31a9952deb315')
_distdir="Data-Types-0.17"

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
