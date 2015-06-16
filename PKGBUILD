# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-mime-encwords'
pkgver='1.014.2'
pkgrel='1'
pkgdesc="deal with RFC 2047 encoded words (improved)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mime-charset>=1.010.1' 'perl>=5.005')
makedepends=()
url='http://search.cpan.org/dist/MIME-EncWords'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEZUMI/MIME-EncWords-1.014.2.tar.gz')
md5sums=('5f809ae650489d1988d8aabd32d4d689')
sha512sums=('279381d2d22dda57d3d9cb57954eae1be14751cbcdb01d49e794b04c43b9a3879684b3a432c4f938d1d47b77fd8869bcf5917d69a35daf492b96879e1c39c03f')
_distdir="MIME-EncWords-1.014.2"

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
