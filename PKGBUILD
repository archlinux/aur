# Maintainer: Happilli <https://github.com/Happilli>
pkgname=cleave
pkgver=1.0.1
pkgrel=1
pkgdesc="Qt6 QML plugin for audio visualization"
arch=('x86_64')
url="https://github.com/Happilli/Cleave"
license=('MIT')
depends=('qt6-base' 'qt6-declarative')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Happilli/Cleave/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('30561959f8efcd5602c531c70d2e95170f4cf23b7ddf3e88569dfaedb56db187')

build() {
  cmake -B build -S "Cleave-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

}
