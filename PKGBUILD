# Maintainer: Rubin Bhandari <roobin.bhandari@gmaiel.com>

pkgname=gray-git
pkgver=0.0.1+git
pkgrel=1
pkgdesc="a status notifier GObject library which can be used to create system trays"
arch=('x86_64')
url="https://github.com/Fabric-Development/gray"
license=('AGPL-3.0')
depends=('meson' 'ninja' 'glibc' 'gcc' 'vala')
makedepends=('meson' 'ninja' 'git')                           # Add make dependencies, including git
source=('git+https://github.com/Fabric-Development/gray.git') # Git repository URL (adjust)
sha256sums=('SKIP')                                           # No checksum for git sources

# Prepare the build environment
prepare() {
  cd "${srcdir}/${pkgname}"
}

# Build the package using Meson and Ninja
build() {
  cd "${srcdir}/${pkgname}"
  meson setup build --prefix=/usr # Configure with Meson
  ninja -C build                  # Build with Ninja
}

# Install the package
package() {
  cd "${srcdir}/${pkgname}"
  ninja -C build install # Install the built package
}
