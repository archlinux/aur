# CPAN Name  : Dancer2-Plugin-Database
# Maintainer: camb
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-dancer2-plugin-database'
pkgver='2.13'
pkgrel='1'
pkgdesc="easy database connections for Dancer2 applications"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dancer-plugin-database-core>=0.12' 'perl-dancer2>=0.151000' 'perl-http-message>=0' 'perl-plack>=1.0032')
makedepends=()
url='https://metacpan.org/release/Dancer2-Plugin-Database'
source=('http://search.cpan.org/CPAN/authors/id/A/AM/AMBS/Dancer2-Plugin-Database-2.13.tar.gz')
md5sums=('ed99ba150f5f2d68c5fffe78cb89e076')
sha512sums=('b0c61280e01a311b784afac95f1fd83d62a1fba0368450ad88efc6ea5f75fe04f97fd0a516468f56f34690a142a41d9a9d0aa86bba238019e37651f3408de9de')
_distdir="Dancer2-Plugin-Database-2.13"

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
