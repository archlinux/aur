# Maintainer: Kaan Genc <kaan@dendron.so>

pkgname=dendron
_npmname="dendron-cli"
_npmver="0.57.1"
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

sha512sums=('2f5f1c6f2116400547f476aed6ac1630d644f042aede10566f2becdda4bf7a9354ee68261d4fb5caeacc2b464fc3c875446dcb1d6f0f6ae7cd298509ae5aa8c2')
