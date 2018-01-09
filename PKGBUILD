# Maintainer: Manoel Vilela <manoel_vilela [at] engineer [dot] com>
pkgname=urn-love-git
pkgver=1.0
pkgrel=1
pkgdesc="LÖVE2D bindings for Urn (Lisp->Lua) language"
arch=('any')
url="https://gitlab.com/Lignum/urn-love2d-bindings"
license=('unknown')
depends=('urn-lang-git')
makedepends=('git')
provides=('urn-love')
source=("urn-love-git::git+https://gitlab.com/Lignum/urn-love2d-bindings.git#branch=master")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  install -dm755 "${pkgdir}/usr/lib/urn/love/"
  find . -type f \( -iname "*.lisp" -or -iname "*.lua" \) \
         -exec install -m644 "{}" "${pkgdir}/usr/lib/urn/love/{}" \;
}
