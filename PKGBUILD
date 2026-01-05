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
#source=("${pkgname}"::"git+https://github.com/lquidfire/"${pkgname}".git#tag="$pkgver"")
source=("${pkgname}::git+https://codeberg.org/peregrinus13/${pkgname}.git#tag=${pkgver}")
validpgpkeys=('E7AAC21597965C6259108D6F471F22BDE25DD664')
# The above is the fingerprint for key-id 0x471F22BDE25DD664
sha256sums=('5834066adcc2a66effe00510abc7035b3f3541a82fb0929449505b4f9c2433a8')

package() {
  cd "$pkgname"
  
  install -Dm754 aggregateCIDR.pl -t "$pkgdir"/usr/bin

  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname

  # license
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
