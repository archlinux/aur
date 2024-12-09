#


pkgname=gray-git
pkgver=0.0.1+git
pkgrel=1
pkgdesc="A status notifier GObject library which can be used to create system trays"
arch=('x86_64')
url="https://github.com/Fabric-Development/gray"
license=('AGPL-3.0')
depends=('meson' 'ninja' 'glibc' 'gcc' 'vala')
makedepends=('meson' 'ninja' 'git')  # Only make dependencies
maintainer="Rubin Bhandari <roobin.bhandari@gmail.com>" 
source=('git+https://github.com/Fabric-Development/gray') # Git repository URL
sha256sums=('SKIP')  # Skip checksum verification for git sources

# Build the package using Meson
build() {
  cd "${srcdir}/gray"

  # Ensure build directory is clean
  rm -rf build

  # Setup the build directory with meson
  meson setup build --prefix=/usr
}

# Install the package
package() {
  cd "${srcdir}/gray"

  # Install using ninja
  ninja -C build install
}
