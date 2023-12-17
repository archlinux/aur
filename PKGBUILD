pkgname=arduino-cmake-toolchain-git
pkgver=1.0.0 
pkgrel=1
pkgdesc="CMake toolchain for Arduino platforms"
arch=('any')
url="https://github.com/a9183756-gh/Arduino-CMake-Toolchain"
license=('GPL')
depends=('cmake' 'arduino')  # Add dependencies here
source=("$pkgname-$pkgver.tar.gz::https://github.com/a9183756-gh/Arduino-CMake-Toolchain/archive/master.tar.gz")
sha256sums=('d961289ed1631e328093e9941fe56e6d3806987800673fe736ed13cf21ca8f20')

build() {
  echo "Nothing to build"
}

package() {
  cd "${srcdir}/Arduino-CMake-Toolchain-master"


  local dest="${pkgdir}/usr/share/${pkgname}"

  # Create the destination directory
  install -dm755 "$dest"

  # Install directories
  cp -dr --no-preserve='ownership' Arduino "$dest"
  cp -dr --no-preserve='ownership' Examples "$dest"
  cp -dr --no-preserve='ownership' Platform "$dest"

  # Install root-level files
  install -Dm644 Arduino-toolchain.cmake "$dest/Arduino-toolchain.cmake"
  install -Dm644 CHANGELOG.md "$dest/CHANGELOG.md"
  install -Dm644 LICENSE.md "$dest/LICENSE.md"
  install -Dm644 README.md "$dest/README.md"

}
