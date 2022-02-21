# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mysql-diff'
pkgver='0.60'
pkgrel='1'
pkgdesc="Generates a database upgrade instruction set"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-slurp>=0' 'perl-string-shellquote>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/MySQL-Diff'
source=("https://cpan.metacpan.org/authors/id/E/ES/ESTRABD/MySQL-Diff-$pkgver.tar.gz")
md5sums=('fddcdca9728760870424d5f75c9c3cfe')
sha512sums=('8e03ba1aca0cde812e62f174db158f8b403f675bc495a9ea430ff59a403f0c61d5c223c5fb0d71c41f5dea4908fee6eb5d8aca463a98235184cba34967932d9f')
_distdir="MySQL-Diff-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
