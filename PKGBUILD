# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-io-aio'
pkgver='4.80'
pkgrel='1'
pkgdesc="Asynchronous/Advanced Input/Output"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.37' 'perl-common-sense')
makedepends=('perl-canary-stability')
url='https://metacpan.org/release/IO-AIO'
source=("http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/IO-AIO-4.8.tar.gz")
md5sums=('024ee9b7383abc8da6bf88be5c626e94')
sha512sums=('b06e20a75b86ab83cf95121d491c54e10f530d006ed0618b95e9d2c63f1974479bcf41e94e0592c62294ffa8860fac0a0fb471dab0437f9dfef75b980ec8966e')
_distdir="IO-AIO-4.8"

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
