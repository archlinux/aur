# Contributor: Catriel Müller <catriel at gmail dot com>
_dlhash=a975f61a
pkgname=synergy1-bin
pkgver=1.14.5
pkgrel=1
pkgdesc="Keyboard and mouse sharing solution. Synergy allows you to share one mouse and keyboard between multiple computers. Work seamlessly across Windows, macOS and Linux."
arch=('x86_64')
url="https://symless.com/synergy"
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
  "https://binaries.symless.com/synergy/v1-core-standard/${pkgver}-stable.${_dlhash}/synergy_${pkgver}-stable.${_dlhash}_ubuntu20_amd64.deb"
)

sha256sums=(
  'f4937d7235f8bb9cd7c8fc95ce5f132d75f3304268af2578d58b7aa8afd5dbc0'
)

package() {
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
  install -D -m644 "${pkgdir}/usr/share/doc/synergy/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
