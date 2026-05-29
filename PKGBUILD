# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=marktext-deb
_pkgname=marktext
pkgver=0.19.0
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
sha256sums=('60eb7f15920f8a6b3be0d3363c9447dafa7379935b1537ffe442e562083b70a3')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
} 
