# Maintainer: Kaito Udagawa <umireon at gmail dot com>
# Contributor: Ng Oon-Ee <n g o o n e e dot t a l k @ gmail dot com>
# Contributor: PedroHLC <root@pedrohlc.com>
pkgname=obs-backgroundremoval

pkgver=1.1.8
pkgrel=1
pkgdesc='Background removal plugin for OBS studio'
_source="${pkgname}-${pkgver}"

arch=(x86_64)
url='https://github.com/royshil/obs-backgroundremoval'
license=('GPL2')
depends=('obs-studio' 'opencv' 'curl')
makedepends=('cmake' 'ninja')
source=("${_source}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c84a6f2cb40fe2df0e8f7745ad41b1dbbf21aea3a3b61de20e2d79b9fc412421')

build() {
  cd "$_source"
  cmake -B build --preset linux-x86_64 -DUSE_SYSTEM_OPENCV=ON
  cmake --build build
}

package() {
  cd "$_source"
  cmake --install build --prefix "$pkgdir/usr"
}
