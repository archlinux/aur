# Maintainer: zapp-brannigan (fuerst.reinje@web.de)

_pkgname=kvdo
pkgname=kvdo-dkms
pkgrel=2
pkgver=6.2.0.219
pkgdesc='A pair of kernel modules which provide pools of deduplicated and/or compressed block storage'
arch=('x86_64')
url="https://github.com/dm-vdo/kvdo"
license=('GPL2')
provides=('kvdo')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/kvdo/archive/$pkgver.tar.gz"
        "dkms.conf")
sha256sums=('9258d760af12421344eb0c97bbbedea2997aa42a1f0696b6bb78ac21923c6dac'
            '516f60bdb28f7a0cb6c8f1f84c656ee7c6aec8feb393538f227ed515372ac88a')

package() {
  mkdir -p "$pkgdir"/usr/src
  cp -r "$_pkgname-$pkgver" "$pkgdir"/usr/src/"$_pkgname-$pkgver"
  sed -e "s/@PKGVER@/${pkgver}/" dkms.conf > "$pkgdir"/usr/src/"$_pkgname-$pkgver"/dkms.conf
}
