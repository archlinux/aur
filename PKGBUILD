# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=ikea-smartlight-git
pkgver=7ad5763852f2163c3bd50ef9de0663079e9dfee7
pkgrel=1
pkgdesc="python framework for controlling the Ikea smart lights (tradfri) "
arch=("x86_64")
url="https://github.com/maltejur/ikea-smartlight/tree/fix_KeyError"
license=("GPL-3.0")
depends=(python python-tqdm libcoap)
source=("$pkgname-$pkgver.tar.gz::https://github.com/maltejur/ikea-smartlight/archive/7ad5763852f2163c3bd50ef9de0663079e9dfee7.tar.gz")
sha256sums=("9c4acd6df33f77e2492f9c56876793c4eafbfd2dcbac9a1238441efab5ed7c78")

build() {
  cd ikea-smartlight-$pkgver
  mv tradfri-authenticate.py tradfri-authenticate
  mv tradfri-groups.py tradfri-groups
  mv tradfri-lights.py tradfri-lights
  mv tradfri-status.py tradfri-status
}

package() {
  cd ikea-smartlight-$pkgver
  mkdir --parents $pkgdir/usr/bin
  cp --parents -rv * $pkgdir/usr/bin
}
