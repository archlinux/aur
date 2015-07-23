# Maintainer: InterGen < InterGen AT InterGenStudios dot com >

_author=E/EW/EWILHELM
_perlmod=wxPerl-Constructors
pkgname=perl-wx-constructors
pkgver=0.0.4
pkgrel=1
pkgdesc='wxPerl::Constructors - parameterized constructors'
arch=('any')
url="http://search.cpan.org/~ewilhelm/wxPerl-Constructors-v0.0.4/lib/wxPerl/Constructors.pm"
license=('GPL' 'PerlArtistic')
depends=(
perl
wxgtk2.8
)
makedepends=(
perl-wx
perl-alien-wxwidgets
perl-module-pluggable
perl-module-build
perl-extutils-xspp
perl-test-base
perl-text-diff
perl-algorithm-diff
perl-spiffy
perl-test-differences
perl-capture-tiny
)
provides=(
perl-wx-constructors
perl-wx-constructors-argmap
)
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/E/EW/EWILHELM/wxPerl-Constructors-v0.0.4.tar.gz")
md5sums=('f98a5d0692bec9df8decc48d26345306')

build() {
  cd "$srcdir/$_perlmod-v$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_perlmod-v$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "$srcdir/$_perlmod-v$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install installdirs=vendor destdir="$pkgdir"
}
