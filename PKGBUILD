# Maintainer: Kaan Genc <aur@bgenc.net>

pkgname=dendron
_npmname="dendron-cli"
_npmver="0.103.0"
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

sha512sums=('3a2e253f4e7043270187d5dc18ef5fc14cafa93fe94a7aca96297c223ee15019a591759b8c320d651d88e6a81c6607000f45889716243c194b53e4d1810e0f4c')
