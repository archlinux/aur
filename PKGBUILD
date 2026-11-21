# Maintainer: Daniel Schroeder <deemes79@googlemail.com>
# Maintainer: Chris Lahaye <mail@chrislahaye.com>

pkgname=cfn-teleport-bin
pkgver=0.52.7
pkgrel=1
pkgdesc="A command-line tool for managing CloudFormation resources across and within stacks"
arch=("aarch64" "arm" "armv7h" "i686" "x86_64")
url="https://github.com/udondan/cfn-teleport"
license=("APACHE")
conflicts=("cfn-teleport")
provides=("cfn-teleport")
replaces=("cfn-teleport")

# Source files
source_aarch64=("${url}/releases/download/v${pkgver}/cfn-teleport-aarch64-unknown-linux-musl-v${pkgver}.tar.gz")
source_arm=("${url}/releases/download/v${pkgver}/cfn-teleport-arm-unknown-linux-musleabihf-v${pkgver}.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/cfn-teleport-armv7-unknown-linux-musleabihf-v${pkgver}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/cfn-teleport-i686-unknown-linux-musl-v${pkgver}.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/cfn-teleport-x86_64-unknown-linux-musl-v${pkgver}.tar.gz")

# Checksums
sha256sums_aarch64=("b728a35ac51aab2ddbc8f1e8e6c173d5314d3ea1bc8a86282b887203406279d7")
sha256sums_arm=("06221900d6100baea45948c24c56eaba3583b93350f7ef1650b21b0725f1a3c8")
sha256sums_armv7h=("d3833dff7b42c31f0ddd3e761e413505fb3feddff327c8363ca9d0fa4b7148da")
sha256sums_i686=("5e83c314a062da48445354aacad5576509a4b2828628fb91bb3c3ef5b3bb89d9")
sha256sums_x86_64=("9deb1bb7c6843af0ab72a38268f7de2eeac9e16605f5f608d982ad9cb64ccb61")

# Build function
build() {
  return 0
}

# Package functions
package() {
  # Extract the package based on the current architecture
  case "$CARCH" in
    'aarch64') tar -xzf "${srcdir}/cfn-teleport-aarch64-unknown-linux-musl-v${pkgver}.tar.gz" -C "${srcdir}/" ;;
    'arm')     tar -xzf "${srcdir}/cfn-teleport-arm-unknown-linux-musleabihf-v${pkgver}.tar.gz" -C "${srcdir}/" ;;
    'armv7h')  tar -xzf "${srcdir}/cfn-teleport-armv7-unknown-linux-musleabihf-v${pkgver}.tar.gz" -C "${srcdir}/" ;;
    'i686')    tar -xzf "${srcdir}/cfn-teleport-i686-unknown-linux-musl-v${pkgver}.tar.gz" -C "${srcdir}/" ;;
    'x86_64')  tar -xzf "${srcdir}/cfn-teleport-x86_64-unknown-linux-musl-v${pkgver}.tar.gz" -C "${srcdir}/" ;;
  esac

  # Move the binary to /usr/bin
  install -Dm755 "${srcdir}/cfn-teleport" "${pkgdir}/usr/bin/cfn-teleport"
}

