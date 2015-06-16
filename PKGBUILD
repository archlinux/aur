# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-image-imlib2'
pkgver='2.03'
pkgrel='1'
pkgdesc="Interface to the Imlib2 image library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Image-Imlib2'
source=('http://search.cpan.org/CPAN/authors/id/L/LB/LBROCARD/Image-Imlib2-2.03.tar.gz')
md5sums=('303b91fae2b863903e41a3cac34fa0d3')
sha512sums=('d38eba0da1d9fe46244400454f55d2d4d682a7aff78c123c01476c14f30de3fc4699a1f926fc82fea09341f0577f943d82fe73cd40225bc69a06e1c710383d60')
_distdir="Image-Imlib2-2.03"

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
