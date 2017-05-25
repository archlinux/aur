# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-y-icons
pkgver='1.0.7'
pkgrel='1'
pkgdesc='New icons from LinuxMint 18 inspired by the Moka icon set. Stable releases'
arch=('any')
url='http://packages.linuxmint.com'
license=('GPL3')
depends=('mint-x-icons' 'gtk-update-icon-cache')
conflicts=('mint-y-icons-git')
source=("${url}/pool/main/m/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('6e0275a9478faba85166a8b42beb0b5b83e547072e8b70369bde1fb3c213cbe8')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
  cd ${srcdir}/${pkgname}
  cp -aR ./usr ${pkgdir}
}


