# Maintainer: Adrian Petrescu <apetresc@gmail.com>
# Maintainer: Scott Cheng <aur@chengscott.io>
# Contributor: Benjamin Auder <benjamin * redua net>
# Contributor: Beej <beej@beej.us>
# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=gogui
pkgver=1.5.4a
pkgrel=3
pkgdesc='SGF editor, can also be used for playing against engines'
arch=('any')
url='https://github.com/Remi-Coulom/gogui'
license=('GPL')
depends=('java-runtime')
makedepends=('apache-ant' 'docbook-xsl' 'java-environment')
source=("${url}/releases/download/v${pkgver}/gogui-v${pkgver}-bin.zip")
sha256sums=('5b03df6d81754bd154ae0d22b17fe9db3b454054feb743fcc739caf9c698b867')
install="${pkgname}.install"

package() {
  cd gogui
  # remove post installation
  head -n -19 install.sh > aur_install.sh
  chmod +x aur_install.sh
  ./aur_install.sh -p "${pkgdir}/usr" -s "${pkgdir}/etc"
}

# vim: ts=2 sw=2 et:
