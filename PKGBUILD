# Maintainer: Kaan Genc <aur@bgenc.net>

pkgname=dendron
_npmname="dendron-cli"
_npmver="0.116.2"
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

sha512sums=('b04721de185d2e4009bcfa1e361d305ad1a7d7e21bed897f14ea1404b76752fd82c40f2dcef5c32153ba4e66afd1e913a0e6ee87aad3c3938d5cd444cbf0427f')
