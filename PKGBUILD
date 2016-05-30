# Contributor: Mildred Ki'Lya <mildred.fr>
pkgname=perl-sender-transport-smtps
pkgver=0.03
pkgrel=1
pkgdesc='Perl::Sender::Transport::SMTPS'
_dist=Email-Sender-Transport-SMTPS
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
makedepends=(perl-module-build-tiny)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/$_dist-$pkgver.tar.gz")

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
  ./Build install installdirs=vendor --destdir="$pkgdir"
}

md5sums=('8b1bb3621bd79e52a596ddba0672f806')
