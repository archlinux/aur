# Maintainer: dringsim <dringsim@qq.com>
pkgname=perl-moosex-handlesconstructor
pkgver=0.001
pkgrel=1
pkgdesc='Moo[se] extension that allows for setting handle accessors with the constructor'
_dist=MooseX-HandlesConstructor
arch=('any')
url="https://metacpan.org/release/$_dist"
license=(
  'GPL-1.0-or-later'
  'Artistic-1.0-Perl'
)
depends=('perl-class-method-modifiers' 'perl-import-into' 'perl-moosex-mungehas')
options=('!emptydirs' 'purge')
source=("https://cpan.metacpan.org/authors/id/Z/ZM/ZMUGHAL/$_dist-$pkgver.tar.gz")
sha256sums=('f5e738d248044ac890f96b99a3493b695c998b709fd02296536c5f4d2cbd69cd')

build() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd $_dist-$pkgver
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
