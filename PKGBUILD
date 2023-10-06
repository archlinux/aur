pkgname=libgedit-gtksourceview-langspec-twig
_gitname=libgedit-gtksourceview-langspec-twig
pkgver=r1.e75762c
pkgrel=1
pkgdesc="Twig language specifications for libgedit-gtksourceview"
arch=('any')
url="https://github.com/gerryd/libgedit-gtksourceview-langspec-twig"
license=('LGPL')
depends=('gedit>=46')
makedepends=('git')
source=("${pkgname}::git+https://github.com/gerryd/libgedit-gtksourceview-langspec-twig.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/libgedit-gtksourceview-300/language-specs"
  install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r twig.lang "${pkgdir}/usr/share/libgedit-gtksourceview-300/language-specs/"
}
