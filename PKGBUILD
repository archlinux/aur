# Maintainer: Daniel Schroeder <deemes79@googlemail.com>
# Maintainer: Chris Lahaye <mail@chrislahaye.com>

pkgname=cfn-teleport
pkgver=0.17.0
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
sha256sums_aarch64=("fd0036067b739e96416f2a09cd9813d1e611baf7f7b27a6147c2b8b79658743e")
sha256sums_arm=("42567ee80ef0325cf92220ad899a3b07d4485ed0e92ffa86f2dce3510f97a13c")
sha256sums_armv7h=("0a2ea48cba4e832e06c272f661432de24116d9ef37b6d0ca0cbc27f943386810")
sha256sums_i686=("ca759d8067affeb6a224ff72cb0d2729def6891d2343ac81ca22eb7a4a1f161b")
sha256sums_x86_64=("20b73cf36ceb3276d28c17894dbaf99f798e0ac3786136d02ef0f75f3991f006")

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

