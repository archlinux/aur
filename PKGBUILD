# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious-plugin-basicauthplus'
pkgver='0.11.3'
pkgrel='1'
pkgdesc="Basic HTTP Auth Helper Plus"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-authen-simple>=0' 'perl-authen-simple-passwd>=0' 'perl-mojolicious>=0' 'perl>=5.6.1' 'perl-ldap>=0')
makedepends=()
url='https://metacpan.org/release/Mojolicious-Plugin-BasicAuthPlus'
source=("http://search.cpan.org/CPAN/authors/id/B/BL/BLR/Mojolicious-Plugin-BasicAuthPlus-${pkgver}.tar.gz")
md5sums=('130fdac7065267c4b041b45298e048a9')
sha512sums=('972181484dd9cfbd960038013db3ebf25e90328ed1bdaa609c3d23adf71a8924fdb7d8ffccb57ff6ef2650c248d758cea13ec61069d7d2caaf585abd1804b554')
_distdir="Mojolicious-Plugin-BasicAuthPlus-${pkgver}"

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
