# Maintainer: Daniel Schroeder <deemes79@googlemail.com>
# Maintainer: Chris Lahaye <mail@chrislahaye.com>

pkgname=cfn-teleport-bin
pkgver=0.49.0
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
sha256sums_aarch64=("a39b1847c985b0f04ae0240f29f8ef19706f7e311ffdcb3d671ab25d2441480b")
sha256sums_arm=("3d90e0474c47d2254dc7a8ff5c1ca892d79a5777ceb34f6da31c5524dc80f7c2")
sha256sums_armv7h=("6b90e82d3f517ea20a550b0520d6e97e08b5e8e46700bfd459671424f7c5ca19")
sha256sums_i686=("a49278c00e00834d18004f8da551896053beded825eb8559e0209d712a553a15")
sha256sums_x86_64=("bbd6405ce31a275e16e57b7611feb463e4f6b3a47e829e93399ce5e62115f5fe")

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

