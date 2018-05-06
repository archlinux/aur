# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-y-icons
pkgver=1.1.5
pkgrel=1
pkgdesc="New icons from LinuxMint 18 inspired by the Moka icon set. Stable releases"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=(gtk-update-icon-cache mint-x-icons)
conflicts=(mint-y-icons-git)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('d321389dad079f31c6e079ab1a7d01a336386be13c64a9903d8daf53dcdc791d')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
  cd $srcdir/$pkgname
  cp -r usr $pkgdir
}
