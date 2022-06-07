# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-moosex-fileattribute
_pkgname=MooseX-FileAttribute
pkgver=0.03
pkgrel=1
pkgdesc="Sugar for classes that have file or directory attributes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose' 'perl-moosex-types' 'perl-moosex-types-path-class')
makedepends=('perl-extutils-makemaker' 'perl-module-install' 'git')
checkdepends=('perl-test-simple' 'perl-test-exception')
url="https://metacpan.org/dist/$_pkgname"
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/$_pkgname-$pkgver.tar.gz")
md5sums=('49a25ad0868b1c08fa39e43b9fa4b23d')
sha256sums=('3e37749f71a107e4aac92641a6206af8529eb8a0cae99a4e68bb63b4bb948359')
sha512sums=('e2e94f679318fa3a0ebeb28143bcf4692177c49dd7c143b6064f3a5f86990c9f9867f1ba79f1c12cbbd20dcbb51ac180e4b102fd152243a07fe3e2d97faaeb88')

build() {
  cd $_pkgname-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd $_pkgname-$pkgver
  make test
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# vim:set sw=2 et:
