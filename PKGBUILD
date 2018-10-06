# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-http-parser-xs'
pkgver='0.17'
pkgrel='1'
pkgdesc="a fast, primitive HTTP request parser"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/HTTP-Parser-XS'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZUHO/HTTP-Parser-XS-0.17.tar.gz')
md5sums=('148579affbdfee247c47460924d6833d')
sha512sums=('44375b93e8aea04bedee283b1796eb6e94a2920be7ae29fe2f7d83491005b4d8f29047ddf52c6d7f62cf5a9f2575d7f6ea7d357e178536f60dd2c3cee08f495e')
_distdir="HTTP-Parser-XS-0.17"

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
