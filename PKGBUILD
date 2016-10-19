# Contributor: Olivier Mehani <shtrom+aur@ssji.net>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-cmd'
pkgver='1.09'
pkgrel='1'
pkgdesc="Perl module for portable testing of commands and scripts"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Test-Cmd'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Test-Cmd-1.09.tar.gz')
md5sums=('a834eb31438d2c58ade6884743963f08')
sha512sums=('1f16d948e68542cb7e0d9e87ae3f5d357d96a80931c7da28d4517b6b2e081c1984bd5e2e68d5fed773eedf6df2107827ab1cb8e65801c41b0432fe7932d6ec1a')
_distdir="Test-Cmd-1.09"

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
