# Contributor: Troy Will <.com AT gmail troydwill>
pkgname=perl-astro-pal
pkgver=1.07
pkgrel=1
pkgdesc='Astro::PAL - Perl interface to Starlink PAL positional astronomy library'
_dist=Astro-PAL
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-test-number-delta)
options=('!emptydirs' purge)
_author=T/TJ/TJENNESS
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_dist-$pkgver.tar.gz")
md5sums=(35fef25bbaecca0d7e319f8e6a07eea9)

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
