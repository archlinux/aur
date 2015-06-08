# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-clean'
pkgver='0.8'
pkgrel='1'
pkgdesc="Cleans up HTML code for web browsers, not humans"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/HTML-Clean'
source=('http://search.cpan.org/CPAN/authors/id/L/LI/LINDNER/HTML-Clean-0.8.tar.gz')
md5sums=('ee562703b7700c7fd4173f355e83ec2c')
sha512sums=('5e9fdf49c1fccbb35c769394dac2013972bea070579983c5c2e99105b2f9a4ca6594966ae88770fc6ae1ee6b9388a07d61830d0451d6957197114d35dc5cc1e4')
_distdir="HTML-Clean-0.8"

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
