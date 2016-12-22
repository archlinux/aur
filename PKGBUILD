# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-json-maybexs'
pkgver='1.003008'
pkgrel='1'
pkgdesc="Use Cpanel::JSON::XS with a fallback to JSON::XS and JSON::PP"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpanel-json-xs>=2.3310' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/JSON-MaybeXS'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/JSON-MaybeXS-1.003008.tar.gz')
md5sums=('5fc1cd29d699dbad7f41e05ccd14118d')
sha512sums=('dd556082ea97cf2b7f492f4e0782b80b9d2810b3b5c13ca06958b8b0eaddd1ba34ea8047cbb332e56716ff4346a2044369386c331efe61830fa4e14075173eb9')
_distdir="JSON-MaybeXS-1.003008"

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
