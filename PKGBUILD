# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-moosex-lazyrequire'
pkgver='0.11'
pkgrel='2'
pkgdesc="Required attributes which fail only when trying to use them"
arch=('any')
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-moose>=0.94' 'perl-aliased>=0.30' 'perl-namespace-autoclean>=0')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-checkdeps>=0.002' 'perl-test-fatal>=0')
url='http://search.cpan.org/dist/MooseX-LazyRequire'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-LazyRequire-$pkgver.tar.gz")
md5sums=('89f708cadb6b524340b01e47c3c44969')
sha512sums=('aec29204be8f023a63fa9e313ac5fa5374c985517eca5a022b4b518495b4158a71b49f36819e954a8f03cf35dd0fb5a183904797e022beeb1a35de7a5532cc14')
_distdir="MooseX-LazyRequire-$pkgver"

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
