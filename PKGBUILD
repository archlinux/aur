# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-unload'
pkgver='0.11'
pkgrel='2'
pkgdesc="Perl/CPAN Module Class::Unload: Unload a class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-inspector')
makedepends=()
checkdepends=('perl-test-requires')
url='https://metacpan.org/release/Class-Unload'
source=('http://search.cpan.org/CPAN/authors/id/I/IL/ILMARI/Class-Unload-0.11.tar.gz')
md5sums=('0c28497de640aea4c3900fb52b7c6cb5')
sha512sums=('464e5c82578bf43ac97a9c434bb1b4889a7b2d5e97d51b5f6965c3de44d81016177d2b1596a93d09bfac38266ffff7bd668b1f15d11444c692530894df9348e8')
_distdir="Class-Unload-0.11"

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
