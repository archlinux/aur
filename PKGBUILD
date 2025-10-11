# Maintainer: Dan Denkijin <dandenkijin at gmail dot com>

pkgname=qinti
pkgver=0.1.0
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
b2sums=('9623f2b7788a5a96e03c2336cf78775a3575ea22bab6bb586bd47e29e330948b6825b26dac3207d280f4bd431bf3d13f8013f023806f8d86b453f7f3e40143c7')
