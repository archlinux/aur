pkgname=lug-wine-tkg-experimental-git
pkgver=11.16
pkgrel=8
pkgdesc="Wine runner based on TKG builds + experimental patches for Star Citizen"
arch=('x86_64')
url="https://github.com/starcitizen-lug/lug-wine-experimental"
license=('LGPL')
options=('!strip')
provides=('lug-wine-tkg-experimental')
conflicts=('lug-wine-tkg-experimental' 'lug-wine-tkg-staging-experimental-git' 'lug-wine-tkg-staging-experimental-wayland-git')

depends=(
  attr             lib32-attr
  fontconfig       lib32-fontconfig
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  desktop-file-utils
)

source=("${pkgname}-${pkgver}-1.tar.gz::https://github.com/starcitizen-lug/lug-wine-experimental/releases/download/${pkgver}-1/${pkgname}-${pkgver}-1.tar.gz")
sha256sums=('6d542ed238aab9dfd002b7dd6fdb19248e35e837ab5d3eda242e797f71f158f0')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${pkgver}-1"/* "${pkgdir}/opt/${pkgname}/"
}
