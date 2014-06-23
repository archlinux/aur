# Contributor: Cedric Girard <girard.cedric@gmail.com>
_author=LMC
_perlmod=RPSL-Parser
pkgname=perl-rpsl-parser
pkgver=0.04000
pkgrel=1
pkgdesc="Router Policy Specification Language (RFC2622) Parser"
arch=(any)
url="http://search.cpan.org/~lmc/RPSL-Parser/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0', 'perl-class-accessor>=0.31')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/${_author:0:1}/${_author:0:2}/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=(f4344b0258b7d55dd5e0923a1fcda33d)

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
