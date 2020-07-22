# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-view-tt'
pkgver='0.44'
pkgrel='1'
pkgdesc="Template View Class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=0' 'perl-class-accessor>=0' 'perl-data-dump>=0' 'perl-mro-compat>=0' 'perl-path-class>=0' 'perl-template-timer>=0' 'perl-template-toolkit>=0' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Catalyst-View-TT'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Catalyst-View-TT-0.44.tar.gz')
md5sums=('0f6b73ea9885ff2839cabf9dbcb91559')
sha512sums=('b3bd246b8286562c453d8b62d0d7c93fd220652309519fb3522cc08db067fe782627a1c4a8d2dd28fa2d993a75c80d14fccfcdd842336e12d3ed5a4c48756a22')
_distdir="Catalyst-View-TT-0.44"

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
