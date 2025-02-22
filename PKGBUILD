# Maintainer: Edmund Lodewijks <edmund at proteamail.com>

pkgname=route-summarization
pkgver=0.2
pkgrel=1
pkgdesc="Summarize CIDR classes with Perl"
arch=(any)
url="https://github.com/lquidfire/route-summarization"
license=('BSD-3-Clause')
depends=('glibc' 'perl' 'perl-net-cidr-lite')
makedepends=('git')
source=("${pkgname}"::"git+https://github.com/lquidfire/"${pkgname}".git#tag="$pkgver"")
validpgpkeys=('E7AAC21597965C6259108D6F471F22BDE25DD664')
# The above is the fingerprint for key-id 0x471F22BDE25DD664
sha256sums=('d8ae45d66415665cdd6e59b3ffd70ad875d301636778f9e7a5cf66fe61b21ff2')

package() {
  cd "$pkgname"
  
  install -Dm754 aggregateCIDR.pl -t "$pkgdir"/usr/bin

  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname

  # license
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
