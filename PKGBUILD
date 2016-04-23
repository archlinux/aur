# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-json-pp'
pkgver='2.27400'
pkgrel='1'
pkgdesc="JSON::XS compatible pure-Perl module."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/JSON-PP'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MAKAMAKA/JSON-PP-2.27400.tar.gz')
md5sums=('544b03d04d141d66cc27c8b9f835195f')
sha512sums=('b872ea18bebd369824319dce2186de5d6f85a0a5576e814e9dd74647df510d1b3cde9f4facacdd238458733b51b2651cd2c4f52bca39528097e3500aac2f704d')
_distdir="JSON-PP-2.27400"

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
