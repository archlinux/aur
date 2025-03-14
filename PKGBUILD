# Maintainer: Adrian Petrescu <apetresc@gmail.com>
# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Benjamin Auder <benjamin * redua net>
# Contributor: Beej <beej@beej.us>
# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=gogui
pkgver=1.6.0
pkgrel=1
pkgdesc='SGF editor, can also be used for playing against engines'
arch=('any')
url='https://github.com/Remi-Coulom/gogui'
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant' 'docbook-xsl' 'java-environment')
source=("${url}/releases/download/v${pkgver}/gogui-v${pkgver}-bin.zip")
b2sums=('716ba57a69d65575e100ae2679b6d3d1375da5f5619b1a0717ccb67633dd3466b36c9de868f7e4700f94f4c659e1f3216c4274f9db54cfab56837c13f64367b7')
install="${pkgname}.install"

package() {
  cd gogui
  # remove post installation
  head -n -19 install.sh > aur_install.sh
  chmod +x aur_install.sh
  ./aur_install.sh -p "${pkgdir}/usr" -s "${pkgdir}/etc"
}

# vim: ts=2 sw=2 et:
