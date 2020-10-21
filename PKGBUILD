# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=perl-app-prove-plugin-passenv
pkgver=0.002
pkgrel=1
pkgdesc='A prove plugin to pass environment variables to your tests behind prove'
_dist=App-Prove-Plugin-PassEnv
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-test-harness')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/H/HU/HURRICUP/$_dist-$pkgver.tar.gz")

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

sha256sums=('bc8ee0513ab921af61eb76c4ff22dad6e3d8530b8c316b8e8054201c0d30a551')
