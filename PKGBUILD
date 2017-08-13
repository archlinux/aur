# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-moosex-role-parameterized'
pkgver=1.10
pkgrel=1
pkgdesc="roles with composition parameters"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-namespace-autoclean')
makedepends=('perl-moose' 'perl-test-fatal')
checkdepends=('perl-test-requires')
url='http://search.cpan.org/dist/MooseX-Role-Parameterized'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Role-Parameterized-$pkgver.tar.gz")
md5sums=('28072021d14dcd8ba40d5a0f08ddfbc8')
sha512sums=('10f6b51dd6e09c30e36496469c4a213e0ab6d12529e0b91161f680ae595b312e9dbff035d6c8a2d10dbff7fa55cf7ca6b53cd66b848f75f7e6ac43b6e6eb9e84')
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
