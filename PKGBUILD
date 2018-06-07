# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-y-icons
pkgver=1.2.5
pkgrel=1
pkgdesc="New icons from LinuxMint 18 inspired by the Moka icon set. Stable releases"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=(gtk-update-icon-cache)
optdepends=("mint-x-icons: enable additional icons to inheritage")
conflicts=(mint-y-icons-git)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('69fb43bbe71411f5abb7438e4488e9d42029cfa6d5405a5b9c5ee5aa9c570fa9')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
  cd $srcdir/$pkgname
  cp -r usr $pkgdir
}
