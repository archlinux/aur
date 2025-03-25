# Maintainer: David J. Allen <allend@lanl.gov>
pkgname=magellan-bin
pkgver=v0.2.0
pkgrel=1
pkgdesc="Redfish-based BMC discovery tool written in Go"
arch=("x86_64" "aarch64")
url="https://github.com/OpenCHAMI/magellan"
license=('MIT')
groups=("openchami")
provides=('magellan')
conflicts=('magellan')
source_x86_64=("${url}/releases/download/${pkgver}/magellan_Linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/magellan_Linux_arm64.tar.gz")
sha256sums_x86_64=('b0e55ef67b7cd6457ccfa16b98175a91c4d85cfc4cee88edf828d295b416f721')
sha256sums_aarch64=('4536a51f479536f8bad0e6eb3972a318c698da66c13c181093eb378b3c87846a')

package() {
  cd "$srcdir/" || exit

  # install the binary to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 magellan "${pkgdir}/usr/bin/magellan"
}

clean() {
  cd "$srcdir/" || exit
  rm *.tar.gz *.tar.zst
}
