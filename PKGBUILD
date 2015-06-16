# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-net-daemon'
pkgver='0.48'
pkgrel='1'
pkgdesc="Perl extension for portable daemons"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.mcpan.org/dist/Net-Daemon'
source=('http://search.mcpan.org/CPAN/authors/id/M/MN/MNOONING/Net-Daemon-0.48.tar.gz')
md5sums=('771f9ba01c3b033ed8cc3d6bad36e5fb')
sha512sums=('85bc280adc0de6be8ebd64771732f83299018edd06441cf96c438914a16c3805918805cde07bae4fe92caa86475ad35cabfc1edfccff117dcce7f5dc8b137bba')
_distdir="Net-Daemon-0.48"

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
