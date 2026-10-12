# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=marktext-deb
_pkgname=marktext
pkgver=0.21.2
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
sha256sums=('45bcb80b0361fcb5f4ff9e379a80d0b4126f385bf20156e7b46d2a398ebdae3b')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
} 
