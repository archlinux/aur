# Maintainer: Kaan Genc <kaan@dendron.so>

pkgname=dendron
_npmname="dendron-cli"
_npmver="0.77.0"
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

sha512sums=('c23ff16a9dee0ae7593dcdb7cfcb4200ad5b79c82fe4a7a36f80cfb803ee13b685c10033df725d5e4a55e1494bc87615bef60fad00d4df82c26c7d5c7bbb60de')
