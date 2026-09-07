# Maintainer: Daniel Schroeder <deemes79@googlemail.com>
# Maintainer: Chris Lahaye <mail@chrislahaye.com>

pkgname=cfn-teleport-bin
pkgver=0.52.0
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
sha256sums_aarch64=("d47c8639f6cdcdd2eb9c3163338075088bc54a746bfe402606aca8aa45311296")
sha256sums_arm=("c507b253497e1d2b608e89e6ff4718730da764eadada23211869a1f0a09bf8dc")
sha256sums_armv7h=("4115b20ea0bb8e09eeb0de2a68b168682edc1af4f76b43bcefa1026c88f1afb4")
sha256sums_i686=("71933cfcebfc27367c6bd19b8f468c664461a1f35ff9e739de2edde627834e56")
sha256sums_x86_64=("eb2bd1108bea51db2a9378dcda6bb24220eab1af956c3c071bf9048ccf241003")

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

