# Maintainer: Daniel Schroeder <deemes79@googlemail.com>
# Maintainer: Chris Lahaye <mail@chrislahaye.com>

pkgname=cfn-teleport-bin
pkgver=0.50.0
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
sha256sums_aarch64=("2ed2a7cbb9cd2885d1c80324f2273b0684a2d8dd317ecfdfccd8b4df28d6791b")
sha256sums_arm=("2748c41506536799ababde87a1737c85552379afc159a23178b045556e772af4")
sha256sums_armv7h=("4d4fc355842cecb0946e947967ddea175a183369945448e2ca268eafbe50e9d8")
sha256sums_i686=("1a9621483cbbe256797e77abb212d35674a8da6677b8d474c58c8e33d5ca2bc9")
sha256sums_x86_64=("08984374d5a78b39834a3378e39eed830779f2316b36bbf08e6658ac55c70820")

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

