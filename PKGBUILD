# Contributor: Troy Will <.com .gmail AT troydwill>
pkgname=perl-astro-coords
pkgver=0.19
pkgrel=1
pkgdesc='Astro::Coords - Class for handling astronomical coordinates'
_dist=Astro-Coords
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl perl-astro-pal perl-astro-telescope perl-module-build perl-datetime perl-test-pod)
options=('!emptydirs' purge)
_author=G/GS/GSB
source=("https://search.cpan.org/CPAN/authors/id/BAZ/$_dist-$pkgver.tar.gz")
md5sums=(9f1570a7a4fd66d1b3fbaacbe6b08ffb)

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
