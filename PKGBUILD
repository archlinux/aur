# Maintainer: An Nguyen (stk) <an@linux.com>
# Original Contributor: Francesco Di Battista <teme.[nospace]84 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-sys-meminfo'
pkgver='0.99'
pkgrel='1'
pkgdesc="Perl extension for return the total amount of physical memory"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Sys-MemInfo'
source=('http://search.cpan.org/CPAN/authors/id/S/SC/SCRESTO/Sys-MemInfo-0.99.tar.gz')
md5sums=('88f0632691d7de91cbed95ba1ff29025')
sha512sums=('ad0f8a12db7f7c643d0eb2d68fb1dcbff43928b786d390243e89d88537bd99360f88af177678ce5141e3870224da80ea5a432c465e8c7ec384abd21014c0e1c0')
_distdir="Sys-MemInfo-0.99"

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
