# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-curry'
pkgver='2.000001'
pkgrel='2'
pkgdesc="Perl/CPAN Module curry: Create automatic curried method call closures for any class or object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/curry'
source=("http://search.cpan.org/CPAN/authors/id/M/MS/MSTROUT/curry-$pkgver.tar.gz")
md5sums=('9f0287738a1352cc8bddfe4f7e73e54f')
sha512sums=('ed86de9dd5af7a3413d0b601975b3efbbcb72fe8c02ca351afcc3af872a59cd78f5a392dea6e545211a97f9994d0655d3f1787973e9f0bf44aa01db97c9afd76')
_distdir="curry-$pkgver"

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
