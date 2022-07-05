# Maintainer: Kaan Genc <aur@bgenc.net>

pkgname=dendron
_npmname="dendron-cli"
_npmver="0.102.1"
pkgver=${_npmver//-/.}
pkgrel=1
pkgdesc="CLI tool for Dendron, the hierarchical note taking tool that grows as you do!"
arch=(any)
url="https://www.dendron.so/"
license=('GPL3')
depends=('nodejs' 'libx11' 'python')
makedepends=('npm')
source=("https://registry.npmjs.org/@dendronhq/dendron-cli/-/${_npmname}-${_npmver}.tgz")
noextract=("${_npmname}-${_npmver}.tgz")
options=(!strip)

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_npmname}-${_npmver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
}

sha512sums=('6c3cc55a7e0ec144fab7bf0ca61a3e61be6c5152b514a6369081057a679159008250f6007adf0d779c56beed507ff5127b16d334e099e918b42530d4e1233fc5')
