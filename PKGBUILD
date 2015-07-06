# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=perl-term-twiddle-qle
pkgver=2.73
pkgrel=1
pkgdesc='Twiddles the cursor while your bored and waiting -*NOTE:without hi-res dep'
_dist=Term-Twiddle
arch=('any')
url="https://metacpan.org/release/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.005')
provides=('perl-term-twiddle')
conflicts=('perl-term-twiddle')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/S/SC/SCOTTW/$_dist-$pkgver.tar.gz")

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
md5sums=('e5d31c85374f66b939f3cb6716604873')
sha256sums=('9306f11d1ea458d8b195a90729284878c9f064460884fe26a473e4511c498ab9')
