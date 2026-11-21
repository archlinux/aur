# Maintainer: Daniel Schroeder <deemes79@googlemail.com>
# Maintainer: Chris Lahaye <mail@chrislahaye.com>

pkgname=cfn-teleport-bin
pkgver=0.52.8
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
sha256sums_aarch64=("9f378584a51efe6335198490f114cb8b4b88dd5dd0336fd69d133712416e0267")
sha256sums_arm=("4e551a3a768d65a207f008aa9735574dc0017b84aaab2053e43d0e2aada0bedc")
sha256sums_armv7h=("4b93a8c4c9bda4ca5a468f317f6067c0815968ec355cae09356a5c145e374699")
sha256sums_i686=("4b77977da19f0a900aeb6f7c9b46fd581035f8208dab9a37cdcdae7ba41b3b70")
sha256sums_x86_64=("3db1fb265f2d00a933f3965ce8cf30f52349b17cb08cc2893c595da31c297b6a")

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

