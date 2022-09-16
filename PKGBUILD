# Contributor: Catriel Müller <catriel at gmail dot com>
pkgname=synergy1-bin
pkgver=1.14.5.17
pkgrel=1
pkgdesc="Keyboard and mouse sharing solution. Synergy allows you to share one mouse and keyboard between multiple computers. Work seamlessly across Windows, macOS and Linux."
arch=('x86_64')
url="https://github.com/DEAKSoftware/Synergy-Binaries"
license=('unknown')
depends=(
  'avahi>=0.6.16'
  'gcc-libs>=5.2'
  'glibc>=2.14'
  'hicolor-icon-theme'
  'libx11>=1.2.99.901'
  'libxext'
  'libxi>=1.2.99.4'
  'libxtst'
  'openssl>=1.1.0'
  'qt5-base>=5.12.2'
)
conflicts=('synergy')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source=(
  "https://github.com/DEAKSoftware/Synergy-Binaries/releases/download/1.14.5.17/synergy-1.14.5.17-ad30acbc-ubuntu-22.04-jammy-jellyfish-x86_64.deb"
)
sha256sums=(
  'bd0125f91b3f5a3e2953d33478716a3b39641c50cb6db76bd15ed4f452263d77'
)

package() {
  # Extract package data
  tar xf data.tar.zst -C "${pkgdir}"
  install -D -m644 "${pkgdir}/usr/share/doc/synergy/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
