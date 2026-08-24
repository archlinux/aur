pkgname=lug-wine-tkg-staging-experimental-wayland-git
pkgver=11.16
pkgrel=8
pkgdesc="Wine runner based on TKG builds + staging + experimental patches for Star Citizen (forces native Wine Wayland driver)"
arch=('x86_64')
url="https://github.com/starcitizen-lug/lug-wine-experimental"
license=('LGPL')
options=('!strip')
provides=('lug-wine-tkg-staging-experimental-wayland')
conflicts=('lug-wine-tkg-staging-experimental-wayland' 'lug-wine-tkg-experimental-git' 'lug-wine-tkg-staging-experimental-git')

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
sha256sums=('82eac27c5cf3cf23d482acb468b14a683f2baeee3066d20fb7e6f0c59cb7793f')

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}-${pkgver}-1"/* "${pkgdir}/opt/${pkgname}/"
}
