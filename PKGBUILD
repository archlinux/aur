# Maintainer: Dan Denkijin <dandenkijin at gmail dot com>

pkgname=qinti
pkgver=0.2.0
pkgrel=1
pkgdesc="A Klingon Glpyh font patcher"
arch=('x86_64') # Adjust as needed (e.g., 'any', 'aarch64')
url="https://github.com/dandenkijin/qinti"
license=('GPL3')  # Adjust based on the actual license
depends=('glibc') # Add actual runtime dependencies
makedepends=('git'
  'rust')
optdepends=('chalbik') # Add optional dependencies
# Source URL with the specific tag and an appropriate directory name
source=("git+https://github.com/dandenkijin/qinti.git#tag=v${pkgver}")

# The build() function compiles the source code
build() {
  # Change to the source directory
  cd "$srcdir/qinti"
  cargo build --release
}

# The package() function installs the built files into the fakeroot environment
package() {
  # Change to the source directory
  cd "$srcdir/qinti"
  install -Dm755 "target/release/qinti" "$pkgdir/usr/bin/qinti"
}
b2sums=('f9eb40df071bfa1f2c6df0f8effd6b003786089bd70a47dda6288d38d7b328ce42f1d84751f32025a68502dbec9ad89cf53dbf9d204360b39c932cee510e623a')
