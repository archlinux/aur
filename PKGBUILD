# Contributor: Troy Will <.com .gmail AT troydwill>
pkgname=perl-astro-telescope
pkgver=0.71
pkgrel=1
pkgdesc='Astro::Telescope - class for obtaining telescope information'
_dist=Astro-Telescope
_author=T/TJ/TJENNESS
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/$_author/$_dist-$pkgver.tar.gz")
md5sums=(b1bd791667a18be7621b2aa5d6534a38)

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
