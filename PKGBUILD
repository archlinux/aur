# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=ikea-smartlight-git
pkgver=52b22aa735d1f09a158a69b18daf9bb3032dbcc8
pkgrel=1
pkgdesc="python framework for controlling the Ikea smart lights (tradfri) "
arch=("x86_64")
url="https://github.com/slokhorst/ikea-smartlight"
license=("GPL-3.0")
depends=(python python-tqdm libcoap)
source=("$pkgname-$pkgver.tar.gz::https://github.com/slokhorst/ikea-smartlight/archive/52b22aa735d1f09a158a69b18daf9bb3032dbcc8.tar.gz")
sha256sums=("93fc04d21fc62d571b5069c5df4b631510c6f74fc362a5577f9ee10adc11fd6e")

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
