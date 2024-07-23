# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=connmaster-cli
pkgver=0.0.5
pkgrel=1
pkgdesc="ConnWifiMaster is a CLI version designed for Arch Linux systems that use ConnMan for network management."
arch=('x86_64')
url="https://github.com/felipealfonsog/ConnWifiMaster"
license=('BSD-3-Clause')
depends=('connman' 'terminology')
source=("https://github.com/felipealfonsog/ConnWifiMaster/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('a37fbd47489a066868294adfdabd4d3e9876dc89fb6a1a71ff7ac664f224a89e')

prepare() {
  cd "$srcdir"
  tar xf "v.${pkgver}.tar.gz"
  mv "ConnWifiMaster-v.${pkgver}" "ConnWifiMaster"
}

build() {
  cd "$srcdir/ConnWifiMaster/CLI"
  chmod +x Connmaster-CLI.sh
}

package() {
  cd "$srcdir/ConnWifiMaster/CLI"

  # Install the script to /usr/local/bin
  install -Dm755 Connmaster-CLI.sh "${pkgdir}/usr/local/bin/connmaster-cli"

  # Install the icon
  install -Dm644 "${srcdir}/ConnWifiMaster/CLI/connmaster-cli-iconlogo.png" "${pkgdir}/usr/share/pixmaps/connmaster-cli.png"

  # Install the .desktop file
  install -Dm644 "${srcdir}/ConnWifiMaster/CLI/connmaster-cli.desktop" "${pkgdir}/usr/share/applications/connmaster-cli.desktop"
}


