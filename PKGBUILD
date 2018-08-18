# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: K. Hampf <k.hampf@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-xml-treepp'
pkgver='0.43'
pkgrel='3'
pkgdesc="Perl/CPAN Module XML::TreePP: Pure Perl implementation for parsing/writing XML documents"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/XML-TreePP'
source=("http://search.cpan.org/CPAN/authors/id/K/KA/KAWASAKI/XML-TreePP-${pkgver}.tar.gz")
md5sums=('f69693066e52591bf1142d3f4e6d37e5')
sha512sums=('4289a0a8100ef15f62f0e303f13094371ac6f1b54d887be1ed7e2ea31d7f1f6fc28d4234cf96458074137f756db3fe452ded170d3ee576f7eb2cfc9996cc31d1')
_distdir="XML-TreePP-${pkgver}"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
