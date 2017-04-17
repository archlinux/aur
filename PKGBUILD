# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-captcha-recaptcha'
pkgver='0.99'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-tiny>=0.904' 'perl-libwww')
makedepends=()
url='https://metacpan.org/release/Captcha-reCaptcha'
source=('http://search.cpan.org/CPAN/authors/id/S/SU/SUNNYP/Captcha-reCaptcha-0.99.tar.gz')
md5sums=('f9e4b1e1c4e32f60dab22b01a32c0de7')
sha512sums=('cdc87a1771bda31e9bc1d88dbb39a07fa0e0fb29117d61857963b9003c0e5e77c9c7c56da15c7521113e58cf90e092f0eefad60787ec7549b1cc5fb814fdb9fd')
_distdir="Captcha-reCaptcha"

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
