# Maintainer: Daniel Schroeder <deemes79@googlemail.com>
# Maintainer: Chris Lahaye <mail@chrislahaye.com>

pkgname=cfn-teleport
pkgver=0.23.0
pkgrel=1
pkgdesc="A command-line tool which can move CloudFormation resources between stacks"
arch=("aarch64" "arm" "armv7h" "i686" "x86_64")
url="https://github.com/udondan/cfn-teleport"
license=("APACHE")

# Source files
source_aarch64=("${url}/releases/download/v${pkgver}/cfn-teleport-aarch64-unknown-linux-gnu-v${pkgver}.tar.gz")
source_arm=("${url}/releases/download/v${pkgver}/cfn-teleport-arm-unknown-linux-gnueabihf-v${pkgver}.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/cfn-teleport-armv7-unknown-linux-gnueabihf-v${pkgver}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/cfn-teleport-i686-unknown-linux-gnu-v${pkgver}.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/cfn-teleport-x86_64-unknown-linux-gnu-v${pkgver}.tar.gz")

# Checksums
sha256sums_aarch64=("82fa6a97fd2964f654fd87a97e25ed6adb67e5e29d3a057b94a9b6a693017304")
sha256sums_arm=("3c3a2cd6e9249c8e27d8be68107dd37bd1c491f382d6a44a12e7ef159d66b3ec")
sha256sums_armv7h=("216eddc70fb0f3fdb65cf1bce886eb17ba4f567b6f137f6186af5c820358a231")
sha256sums_i686=("acb90559c8d51775a5221d60678425a0391c5e67ec1b4d17659e38cd0c7b2018")
sha256sums_x86_64=("6f1cc95bc2e117a439c4b2ad86a4932c0199ffd0d7f720abef8c0a732a238cd9")

# Build function
build() {
  return 0
}

# Package functions
package() {
  # Extract the package based on the current architecture
  case "$CARCH" in
    'aarch64') tar -xzf "${srcdir}/cfn-teleport-aarch64-unknown-linux-gnu-v${pkgver}.tar.gz" -C "${srcdir}/" ;;
    'arm')     tar -xzf "${srcdir}/cfn-teleport-arm-unknown-linux-gnueabihf-v${pkgver}.tar.gz" -C "${srcdir}/" ;;
    'armv7h')  tar -xzf "${srcdir}/cfn-teleport-armv7-unknown-linux-gnueabihf-v${pkgver}.tar.gz" -C "${srcdir}/" ;;
    'i686')    tar -xzf "${srcdir}/cfn-teleport-i686-unknown-linux-gnu-v${pkgver}.tar.gz" -C "${srcdir}/" ;;
    'x86_64')  tar -xzf "${srcdir}/cfn-teleport-x86_64-unknown-linux-gnu-v${pkgver}.tar.gz" -C "${srcdir}/" ;;
  esac

  # Move the binary to /usr/bin
  install -Dm755 "${srcdir}/cfn-teleport" "${pkgdir}/usr/bin/cfn-teleport"
}

