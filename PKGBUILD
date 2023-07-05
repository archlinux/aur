# Maintainer: Daniel Schroeder <deemes79@googlemail.com>
# Maintainer: Chris Lahaye <mail@chrislahaye.com>

pkgname=cfn-teleport
pkgver=0.6.0
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
sha256sums_aarch64=("d4798681ed2f6e67fe81bf9d2c6c959dddb510e99967e4de2422ee5d4e9fb49a")
sha256sums_arm=("3a9eca3ec301dfd92c2a1029367ff0453cf93f9ddf65b315b49ec8e1cf8fa57c")
sha256sums_armv7h=("3e95f8a751a476eb351f7d7865d78c31e76dbd600bcf08b10a305c0c7157408a")
sha256sums_i686=("2ac60745f136768f8b792f3c3b5686cdce1fa2ea50b783595bd74eed057322ae")
sha256sums_x86_64=("7c749b03c86dbdba3718ba429cbaa03143bafe472cd8c358c8e818886cb87e36")

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

