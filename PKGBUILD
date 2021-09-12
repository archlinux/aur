# Maintainer: df543 <df543@protonmail.com>
pkgname=ss-face
pkgver=3.1.0
pkgrel=2
pkgdesc="ss-face is a simple, cross-platform GUI for shadowsocks client, supports multiple implementations."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/df543/shadowsocks-face"
license=('GPL3')
depends=(
  'qt5-base'
)
makedepends=(
  'cmake'
)
optdepends=(
  'shadowsocks-rust: recommended shadowsocks backend'
  'shadowsocks-libev: another shadowsocks backend'
)

source=("https://github.com/df543/shadowsocks-face/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1a4dd0d17ff80655a68f331ef4b8cc129b3e2faaa30ed8387cd514e6836b2912')

build() {
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DQT_VERSION=5 shadowsocks-face-${pkgver}
  make ss-face
}

package() {
  make DESTDIR="$pkgdir" install
}
