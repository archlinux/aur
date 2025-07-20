# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-dmp'
pkgver='0.242'
pkgrel='3'
pkgdesc="Dump Perl data structures as Perl code"
arch=('any')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-regexp-stringify>=0' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Data-Dmp'
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PERLANCAR/Data-Dmp-$pkgver.tar.gz")
md5sums=('0d85de7167332cfee11bf946573db522')
sha512sums=('1e1b267e4082751682c188031db820291e407824d6dea162cf87f93a314b9fee663ce09512ff8ff8ea7f8359131d5449ed82f4ca95095953fedc0f342060f65c')
_distdir="Data-Dmp-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
