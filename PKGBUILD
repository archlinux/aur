# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-sql-abstract-more'
pkgver='1.27'
pkgrel='1'
pkgdesc="extension of SQL::Abstract with more constructs and more flexible API"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mro-compat>=0' 'perl-params-validate>=0' 'perl-sql-abstract>=1.73' 'perl-namespace-clean>=0' 'perl>=5.8.0')
makedepends=('perl-list-moreutils>=0' 'perl-module-install>=0' 'perl-sql-abstract>=0')
checkdepends=('perl-test-exception>=0')
url='https://metacpan.org/release/SQL-Abstract-More'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAMI/SQL-Abstract-More-1.27.tar.gz')
md5sums=('0a829fe022ace37e61901a5a0a936b17')
sha512sums=('1e36a68714694d31cda68d71cc17419e93b7f83d0e66726946288419b30ed8030b49a5ab74b85bc930cc6d1ea1130bc39d3cd7849e3d0a9fd23d8a00dbe17ee5')
_distdir="SQL-Abstract-More-1.27"

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
