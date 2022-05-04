# Maintainer: Kaan Genc <kaan@dendron.so>

pkgname=dendron
_npmname="dendron-cli"
_npmver="0.93.0"
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

sha512sums=('b35aa7e3cf82c12258ec3bc496654bad43d9b0d9daf2b8ecefb413b536139382898111425440665a91c4618c2c149481a331f0f4148b7292aa544d3eac51ffd6')
