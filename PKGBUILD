# Maintainer: Kaan Genc <aur@bgenc.net>

pkgname=dendron
_npmname="dendron-cli"
_npmver="0.101.0"
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

sha512sums=('8f642c8bad883a4b9e76cdd89f286d7d473b14100025f450fe7e7f5619303dbfdbc9c3bf43267f3df19292b35316fc7cecb1f411c652eab43ef72f3132c9d475')
