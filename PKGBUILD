# Maintainer: archlinux.info:tdy
# Generator: CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-dumper'
pkgver='2.161'
pkgrel='1'
pkgdesc="stringified perl data structures, suitable for both printing and eval"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Data-Dumper'
source=('http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Data-Dumper-2.161.tar.gz')
md5sums=('0c18654f06366c494d5c72801eab9393')
sha512sums=('9da8ee6912dcc5f63ca6659b323bbafd7db335fb173e6d9dd14745fa93b596c14bf278e4183aef90ca628e6b473da17297b0b3ac49ebec049dd18d1a5e053201')
_distdir="Data-Dumper-2.161"

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
