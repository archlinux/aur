# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=marktext-deb
_pkgname=marktext
pkgver=0.19.1
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
sha256sums=('e0eaa1967d6cd82e6f96a44766886c79b122a961709b1f1d26c1276b046c84d1')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
} 
