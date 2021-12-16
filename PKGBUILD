# Maintainer: Kaan Genc <kaan@dendron.so>

pkgname=dendron
_npmname="dendron-cli"
_npmver="0.73.0"
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

sha512sums=('c9379fb7ff548f68b18ea0146dcdf4ad59c9b2e1811dd00cbdec31900d3cfc6ee50d2ad0819291baaa0e1b5ae27c836b402025c418c43cdf5c28162ad8b3d223')
