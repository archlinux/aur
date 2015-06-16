# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dbix-class-cursor-cached'
pkgver='1.001002'
pkgrel='1'
pkgdesc="cursor class with built-in caching support"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-carp-clan>=6.0' 'perl-dbix-class>=0.08124')
makedepends=('perl-cache-cache' 'perl-dbd-sqlite>=1.25')
url='http://search.cpan.org/dist/DBIx-Class-Cursor-Cached'
source=('http://search.cpan.org/CPAN/authors/id/A/AR/ARCANEZ/DBIx-Class-Cursor-Cached-1.001002.tar.gz')
md5sums=('814a9613314026d5771e67865a2445e8')
sha512sums=('95b5fb884610e9d557f12fab9a904c965039b1710c7d07636fae291cd1b3a3e117a19aaf2f224989ee408e7b5a24e38120494de1d17122ad677f4c480299c74c')
_distdir="DBIx-Class-Cursor-Cached-1.001002"

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
