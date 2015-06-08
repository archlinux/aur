# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-math-factor-xs'
pkgver='0.40'
pkgrel='1'
pkgdesc="Factorize numbers and calculate matching multiplications"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-boolean' 'perl-list-moreutils' 'perl-params-validate')
makedepends=()
url='http://search.cpan.org/dist/Math-Factor-XS'
source=('http://search.cpan.org/CPAN/authors/id/K/KR/KRYDE/Math-Factor-XS-0.40.tar.gz')
md5sums=('fec7d1291fd9fecebe316d57f2a16cd3')
sha512sums=('3b7c2df63f02585ea5508217fa93292db74ed5c94e379dc6ef9b9887c6b5cdccf76f36e30b71e50848cfe698a262d99049918075b28ac44d07aabf7fb7d799b3')
_distdir="Math-Factor-XS-0.40"

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
