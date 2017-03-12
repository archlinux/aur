# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=rclone-browser
pkgver=1.2
pkgrel=1
pkgdesc='Simple cross-platform GUI for rclone'
url='https://mmozeiko.github.io/RcloneBrowser/'
arch=('i686' 'x86_64')
license=('custom:Public Domain')
source=("https://github.com/mmozeiko/RcloneBrowser/archive/${pkgver}.tar.gz")
sha256sums=('679c4cae5ede309e8ae8f67c482ecef0194fac5fabe9c1784fe4638c4d5bfdb6')
makedepends=('cmake')
depends=('qt5-base' 'rclone')

package() {

  cd "$srcdir"/RcloneBrowser-${pkgver}
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DCMAKE_BUILD_TYPE=Release
  cmake --build . --target install

  install -Dm644 "$srcdir"/RcloneBrowser-${pkgver}/LICENSE \
                "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
