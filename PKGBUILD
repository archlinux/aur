pkgname=lug-wine-tkg-experimental-git
pkgver=11.10
pkgrel=7
pkgdesc="Wine runner based on TKG builds + experimental patches for Star Citizen"
arch=('x86_64')
url="https://github.com/starcitizen-lug/lug-wine-experimental"
license=('LGPL')
options=('!strip')
provides=("wine=${pkgver}" "wine-staging=${pkgver}" 'lug-wine-tkg-experimental')
conflicts=('wine' 'wine-staging' 'wine-cachyos' 'lug-wine-tkg-experimental' 'lug-wine-tkg-staging-experimental-git' 'lug-wine-tkg-staging-experimental-wayland-git')

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
sha256sums=('1503cc2ee01942f2ef3d0b165a75b9480f7b20166877d940b040991c5b25ce12')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-1"

  # Install to /usr
  install -d "${pkgdir}/usr"
  cp -dr bin include lib share "${pkgdir}/usr/"
}
