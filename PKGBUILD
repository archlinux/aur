# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=marktext-deb
_pkgname=marktext
pkgver=0.23.0
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
sha256sums=('08ca17b684668b0c5ef927b81ace69b2ba420e2e89a3fd7a9f192bab7443807d')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
} 
