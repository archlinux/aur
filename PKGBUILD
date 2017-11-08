# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-y-icons
pkgver=1.0.9
pkgrel=1
pkgdesc="New icons from LinuxMint 18 inspired by the Moka icon set. Stable releases"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=(gtk-update-icon-cache mint-x-icons)
conflicts=(mint-y-icons-git)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('bfb6e2ff9eaaa9b2527cb0dbc468fa4d86a109226bbfce7e63715c4981322646')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
  cd $srcdir/$pkgname
  cp -r usr $pkgdir
}
