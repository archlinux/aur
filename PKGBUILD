# Maintainer : y5nw <y5nw at outlook dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-tcl-tk'
pkgver='1.29'
pkgrel='1'
pkgdesc="Extension module for Perl giving access to Tk via the Tcl extension"
_dist='Tcl-Tk'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl-tcl>=1.11' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Tcl-Tk'
source=("http://search.cpan.org/CPAN/authors/id/V/VK/VKON/$_dist-$pkgver.tar.gz")
md5sums=('2e0f38d620f0bfb5af8ecd5582c58ee9')
sha512sums=('1ca5d2d050cec98e93378aa92ac7f7bf4ae2510c81fbb531e6c34885a44d4216556304cb58198517bb3712031f9b528e8532a5735f7e374e1ae82f909dcd3410')
_distdir="$_dist-$pkgver"

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
