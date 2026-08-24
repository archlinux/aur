pkgname=lug-wine-tkg-staging-experimental-git
pkgver=11.16
pkgrel=8
pkgdesc="Wine runner based on TKG builds + staging + experimental patches for Star Citizen"
arch=('x86_64')
url="https://github.com/starcitizen-lug/lug-wine-experimental"
license=('LGPL')
options=('!strip')
provides=('lug-wine-tkg-staging-experimental')
conflicts=('lug-wine-tkg-staging-experimental' 'lug-wine-tkg-experimental-git' 'lug-wine-tkg-staging-experimental-wayland-git')

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
sha256sums=('78a92d92340cf3663f988d4b53f523d287b584732ce7102a55084bbe042b0158')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${pkgver}-1"/* "${pkgdir}/opt/${pkgname}/"
}
