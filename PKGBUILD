# shellcheck disable=2034,SC2164
# Maintainer: Andres Rodriguez Michel <andresmichelrodriguez@gmail.com>
_pkgname=@prisma/language-server
pkgname=prisma-language-server
pkgver=31.9.0
pkgrel=1
pkgdesc="Language Server Protocol (LSP) implementation for Prisma"
arch=(any)
url="https://www.npmjs.com/package/@prisma/language-server"
makedepends=(npm)
source=("https://registry.npmjs.org/${_pkgname}/-/language-server-${pkgver}.tgz")
noextract=("language-server-${pkgver}.tgz")
md5sums=("e15fc3140c94869611755637f10d6970")

package() {
  cd $srcdir
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "${pkgdir}/usr" "${_pkgname}@${pkgver}"
  chown -R root:root "${pkgdir}"
}
