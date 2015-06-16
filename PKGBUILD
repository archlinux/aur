# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-catalyst-plugin-session-store-dbic'
pkgver='0.14'
pkgrel='1'
pkgdesc="Store your sessions via DBIx::Class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-plugin-session-store-delegate>=0.05' 'perl-catalyst-runtime>=0' 'perl-class-accessor>=0' 'perl-dbix-class>=0.07000' 'perl-mro-compat>=0')
makedepends=()
checkdepends=('perl-test-warn>=0.20')
url='http://search.cpan.org/dist/Catalyst-Plugin-Session-Store-DBIC'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-Plugin-Session-Store-DBIC-0.14.tar.gz')
md5sums=('8075626aa269768481f15eb2059014ff')
sha512sums=('0cdbb8d8f1cacc931fd37432fab07f18e3d7edaa0d4305b50486df63ab799ffc977bae7144f83947a0ee72eca7ae3d195a64ee60f5293f96d2b46c0baad0b88a')
_distdir="Catalyst-Plugin-Session-Store-DBIC-0.14"

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
