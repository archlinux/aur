# Maintainer: Kaan Genc <aur@bgenc.net>

pkgname=dendron
_npmname="dendron-cli"
_npmver="0.108.0"
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

sha512sums=('02564427e33254f2cb097e8d646bc1a8650aa3369564449d0cd63f3d77bacc5cff7aaa436e7882eb6815d674f891d1fbc3ea46e46897876eaca3c4642098741f')
