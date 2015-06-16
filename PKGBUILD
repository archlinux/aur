# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-cpanel-json-xs'
pkgver='3.0104'
pkgrel='1'
pkgdesc="JSON::XS for Cpanel, fast and correct serialising, also for 5.6.2"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Cpanel-JSON-XS'
source=('http://search.cpan.org/CPAN/authors/id/R/RU/RURBAN/Cpanel-JSON-XS-3.0104.tar.gz')
md5sums=('9ddb6ca3dc80ce965181f15fc7df8062')
sha512sums=('df8d6c247c9c07e5f240ea0b365faf022a4a6996c007c548abd43f7fbe50dedbf16c1e73b14954859ec55b0a6fa7e5164d093fb184f49a2a725bde4dc582bd52')
_distdir="Cpanel-JSON-XS-3.0104"

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
