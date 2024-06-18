# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-http-tinyish'
pkgver='0.19'
pkgrel='1'
pkgdesc="HTTP::Tiny compatible HTTP client wrappers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-which>=0' 'perl-ipc-run3>=0' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/HTTP-Tinyish'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/HTTP-Tinyish-0.19.tar.gz')
md5sums=('2db74d1dbfaa2d66a2f6d5570b68c0ac')
sha512sums=('cfc20e7b526c91a9baf8d049753762c35033c5e1bdf5b5239ba7695c2b0319e1e41bc669f617fc7e61ef8fcfaddbcdd299fad2c406d9cb166be304c401401010')
_distdir="HTTP-Tinyish-0.19"

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
