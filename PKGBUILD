# Contributor: Daichi Shinozaki <dseg@shield.jp>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-finance-yahoojpn-quote'
pkgver='1.08'
pkgrel='1'
pkgdesc="Fetch historical Japanese stock quotes on Yahoo! Japan Finance."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.16.3')
makedepends=()
url='http://search.cpan.org/dist/Finance-YahooJPN-Quote'
source=('http://search.cpan.org/CPAN/authors/id/H/HA/HATA/Finance-YahooJPN-Quote-1.08.tar.gz')
md5sums=('091e74b958c1fc01c5fcfeb9ee9c8db1')
sha512sums=('98bfa72bb68bf9308341f9fe8d17603dde92679e4d124c5a5ebaf7fdba7f84e5d291e2d2f3d698c35c2eb193e7792c658e3385c825abc1262f0e53620523cb7f')
_distdir="Finance-YahooJPN-Quote-1.08"

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
