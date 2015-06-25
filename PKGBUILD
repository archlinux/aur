# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-crypt-xtea_pp'
pkgver=0.0106
pkgrel=1
pkgdesc='Pure Perl Implementation of the eXtended Tiny Encryption Algorithm'
_dist='Crypt-XTEA_PP'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.10' 'perl-carp>=1.3301' 'perl-scalar-list-utils>=1.38' 'perl-scalar-util-numeric>=0.40')
checkdepends=('perl>=5.10')
makedepends=()
provides=()
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/J/JA/JAHIY/$_dist-$pkgver.tar.gz")
sha256sums=('b42d85386080b460bdb72a0b3636641f855795b91b5d22052d8818c09aabd9a1')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
