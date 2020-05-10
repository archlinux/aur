# Contributor: Jie Zhu <alienchuj@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-class-refresh'
pkgver='0.07'
pkgrel='1'
pkgdesc="refresh your classes during runtime"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0' 'perl-class-unload>=0' 'perl-devel-overrideglobalrequire>=0' 'perl-try-tiny>=0')
makedepends=()
checkdepends=('perl-test-fatal>=0' 'perl-test-requires>=0')
url='https://metacpan.org/release/Class-Refresh'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/Class-Refresh-0.07.tar.gz')
md5sums=('12d9332777c7654368010548386aa2d9')
sha512sums=('68f8aad3d76b27830d6973f5713716275486aed414d05a6212378d1c71dc615b7c048a684d0994fd4fca82b037ce0ea5901c7d3843454a7073ec367908c58514')
_distdir="Class-Refresh-0.07"

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
