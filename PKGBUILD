# shellcheck disable=2034,SC2164
# Maintainer: Andres Rodriguez Michel <andresmichelrodriguez@gmail.com>
_pkgname=@prisma/language-server
pkgname=nodejs-prisma-language-server
pkgver=4.13.0
pkgrel=1
pkgdesc="Language Server Protocol (LSP) implementation for Prisma"
arch=(any)
url="https://github.com/prisma/language-tools/tree/main/packages/language-server"
makedepends=(npm)
source=("https://registry.npmjs.org/${_pkgname}/-/language-server-${pkgver}.tgz")
noextract=("language-server-${pkgver}.tgz")
md5sums=("d49d102c240850f4e17a597ccf42e32a")

package() {
  cd $srcdir
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "${pkgdir}/usr" "${_pkgname}@${pkgver}"
  chown -R root:root "${pkgdir}"
}
