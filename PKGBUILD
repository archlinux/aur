# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious-plugin-oauth2'
pkgver='2.02'
pkgrel='1'
pkgdesc="Auth against OAuth2 APIs including OpenID Connect"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-io-socket-ssl>=1.94' 'perl-mojolicious>=8.25')
makedepends=()
url='https://metacpan.org/release/Mojolicious-Plugin-OAuth2'
source=('http://search.cpan.org/CPAN/authors/id/J/JH/JHTHORSEN/Mojolicious-Plugin-OAuth2-2.02.tar.gz')
md5sums=('c0fbee8169c8ce50081d977ad8d0936f')
sha512sums=('a3d24170508b70bc369d7434a4bd6cf6141c12a1c805b78e640fa66bbc266c480d4ab96084e99fed223e7889fc55a11022809642c165c4e63095239cc83d1c26')
_distdir="Mojolicious-Plugin-OAuth2-2.02"

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
