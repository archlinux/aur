# Maintainer: Scott Marshall <marshals@gmail.com>
# Contributor: Catriel Müller <catriel at gmail dot com>
_dlhash=88fdd263
pkgname=synergy1-bin
pkgver=1.14.6
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
  'libnotify>=0.8'
  'libx11>=1.2.99.901'
  'libxext'
  'libxi>=1.2.99.4'
  'libxkbfile>=1.1.2'
  'libxtst'
  'openssl>=1.1.0'
  'qt5-base>=5.12.2'
)
conflicts=('synergy')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source=(
  "https://s3.us-east-1.amazonaws.com/binaries.symless.com/synergy/v1-core-standard/${pkgver}-snapshot.${_dlhash}/synergy_${pkgver}-snapshot.${_dlhash}_ubuntu20_amd64.deb"
)

sha256sums=(
  '557e6af94660e997edd704df88bb364db9dcd4be844855981fcc53f5497a5e6f'
)

package() {
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
  install -D -m644 "${pkgdir}/usr/share/doc/synergy/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}