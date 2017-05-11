# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mint-y-icons
pkgver='1.0.5'
pkgrel='1'
pkgdesc='New icons from LinuxMint 18 inspired by the Moka icon set. Stable releases'
arch=('any')
url='http://packages.linuxmint.com'
license=('GPL3')
depends=('mint-x-icons' 'gtk-update-icon-cache')
conflicts=('mint-y-icons-git')
source=("${url}/pool/main/m/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('4c1402814e25deca0342721034b06e38220a1043c61f33136826ec8c6895b385')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
  cd ${srcdir}/${pkgname}
  cp -aR ./usr ${pkgdir}
}


