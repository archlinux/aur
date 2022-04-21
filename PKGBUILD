# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
_author=LMC
_perlmod=RPSL-Parser
pkgname=perl-rpsl-parser
pkgver=0.04000
pkgrel=2
pkgdesc="Router Policy Specification Language (RFC2622) Parser"
arch=(any)
url="https://metacpan.org/release/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0', 'perl-class-accessor>=0.31')
makedepends=('perl-module-build')
options=(!emptydirs)
source=(https://cpan.perl.org/modules/by-authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('239cea155a166985892347b37968316f46f36114d050a0be8d71436fd08e90f1')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build

}
package() {
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build install
}

# vim:set ts=2 sw=2 et:
