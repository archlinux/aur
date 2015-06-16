# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-linux-meminfo'
pkgver='0.03'
pkgrel='1'
pkgdesc="Perl extension for accessing /proc/meminfo"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Linux-MemInfo'
source=('http://search.cpan.org/CPAN/authors/id/C/CK/CKERNER/Linux-MemInfo-0.03.tar.gz')
md5sums=('fd9a26e16d8bc8e38e5bae145f3d55ac')
sha512sums=('38bf09e9583b2d4e1944d2fd66d025519a154f45b3d1a14c00410e72df734d3834ac4590d4e6fa2eae3d84d4f8287c63e2c18ecf89dc9f6e1aa1d724adc42151')
_distdir="Linux-MemInfo-0.03"

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
