# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-app-nopaste'
pkgver='1.013'
pkgrel='1'
pkgdesc="Easy access to any pastebin"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-browser-open>=0' 'perl-class-load>=0' 'perl-clipboard>=0' 'perl-getopt-long-descriptive>=0' 'perl-json-maybexs>=0' 'perl-module-pluggable>=0' 'perl-module-runtime>=0' 'perl-path-tiny>=0' 'perl-uri>=0' 'perl-www-mechanize>=0' 'perl-www-pastebin-pastebincom-create>=1.003' 'perl-libwww>=0' 'perl-namespace-clean>=0.19' 'perl>=5.8.3')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-fatal>=0')
url='https://metacpan.org/release/App-Nopaste'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/App-Nopaste-1.013.tar.gz')
md5sums=('a32fe4ee8f8887dc9064c221eaf7372f')
sha512sums=('2b399c22600f5bd1a65e7407181fe8fd23f7f604c335f78a95e422ab7c1195469909fc1d9343eb0843f6b3d778426e51e79e38b0faf6b3e9e4cb8e3977444526')
_distdir="App-Nopaste-1.013"

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
