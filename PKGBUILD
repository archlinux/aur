# Contributor: Christos Nouskas <nous@archlinux.us>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-types-uri'
pkgver='0.006'
pkgrel='1'
pkgdesc="type constraints and coercions for URIs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-type-tiny>=0' 'perl-types-path-tiny>=0' 'perl-types-uuid>=0' 'perl-uri>=0' 'perl-uri-fromhash>=0' 'perl>=5.008')
makedepends=()
checkdepends=('perl-test-requires>=0')
url='https://metacpan.org/release/Types-URI'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/Types-URI-0.006.tar.gz')
md5sums=('ad33c2cdb8f8a9bf23974c48dafaeb6c')
sha512sums=('554e9a8297cc2d613713e3bba73498c0c837d1eaddfe7a1137bb72913e8d31e3945875ce6249ad4b2b003f3488592db54211f5fcf2f006d17334bd26a0012f15')
_distdir="Types-URI-0.006"

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
