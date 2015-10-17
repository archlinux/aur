# Contributor: Michael Gerdau <mgd@qata.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-statistics-descriptive'
pkgver='3.0609'
pkgrel='1'
pkgdesc="Module of basic descriptive statistical functions."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-list-moreutils>=0')
makedepends=()
url='https://metacpan.org/release/Statistics-Descriptive'
source=('http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Statistics-Descriptive-3.0609.tar.gz')
md5sums=('3fa7a705742d2ba942b9e0b167fdb48b')
sha512sums=('06e3fe107085eab058c3816211e91069ac8c52bd3c5276ee61f0ad6d684a957bd02767fe6080aa12b93f6fb3b9f4cad30814fcfa0aba446d73861868f567ff4f')
_distdir="Statistics-Descriptive-3.0609"

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
