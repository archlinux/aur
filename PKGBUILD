# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-y-icons
pkgver=1.2.9
pkgrel=1
pkgdesc="New icons from LinuxMint 18 inspired by the Moka icon set. Stable releases"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL3')
depends=(gtk-update-icon-cache)
optdepends=("mint-x-icons: enable additional icons to inheritage")
conflicts=(mint-y-icons-git)
source=("${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('13a67a3652f5c94ba3806df9ebbebc4a363724730be242a44987a9b5d71b3d0b')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
  cd $srcdir/$pkgname
  cp -r usr $pkgdir
}
