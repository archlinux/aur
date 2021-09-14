# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-moosex-role-parameterized'
pkgver=1.11
pkgrel=1
pkgdesc="roles with composition parameters"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-namespace-autoclean')
makedepends=('perl-moose' 'perl-test-fatal' 'perl-module-build-tiny')
checkdepends=('perl-test-requires' 'perl-test-needs')
url='http://search.cpan.org/dist/MooseX-Role-Parameterized'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Role-Parameterized-$pkgver.tar.gz")
md5sums=('a326fd9fb065dafc75fc0211797968e8')
sha512sums=('7442a10f1593cecfcb01e93f314bcb6ebe95b4b9710262ef5dc7d8065ae118a96e0abbbc9f7b8986c33185a8b8aec60cf8639c0fd6eee4fb94f2e33d95eb7ed9')
_distdir="MooseX-Role-Parameterized-${pkgver}"

build() {
  cd "$_distdir"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$_distdir"
  make test
}

package() {
  cd "$_distdir"
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
