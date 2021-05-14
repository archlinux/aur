# Maintainer: Kaan Genc <kaan@dendron.so>

pkgname=dendron
_npmname="dendron-cli"
_npmver="0.41.1-alpha.0"
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

sha512sums=('c3876655f2f79be832e1732ece02d9877b97c7d0213079d2b1416dde4f1b3a2046d381cd94009b749d28bdd6b458769fb31ad7d2c05783f2a0d2fc6efab0a52d')
