# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=marktext-deb
_pkgname=marktext
pkgver=0.20.0
pkgrel=1
pkgdesc=" A simple and elegant open-source markdown editor that focused on speed and usability."
arch=("x86_64")
url="https://github.com/marktext/marktext"
license=(MIT)
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('gtk3'  'libsecret'  'libxkbfile'  'libxss'  'nss')
source=(
  "$url/releases/download/v$pkgver/$_pkgname-linux-$pkgver.deb")
sha256sums=('2ec37fcc8598c8796dc2fedfc69bc46b2d6b68f12106d8b2d334e095fc2b20cf')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
} 
