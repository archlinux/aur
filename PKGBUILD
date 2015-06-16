# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-mime-charset'
pkgver='1.010.1'
pkgrel='1'
pkgdesc="Charset Information for MIME"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.005')
makedepends=()
url='http://search.cpan.org/dist/MIME-Charset'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEZUMI/MIME-Charset-1.010.1.tar.gz')
md5sums=('3fcd1e3575e8911ae83c5da902947994')
sha512sums=('9918f4e9fdbe2b3a049b2f4402c7c34dd9d756635beb4883cd216fdf0eda30c20a36fa75dbcef9f481eea6e8711cf26fb9189e8554fb0d14c918f13c3db85a27')
_distdir="MIME-Charset-1.010.1"

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
