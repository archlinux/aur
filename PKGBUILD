# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=juliadoc-git
pkgver=r55.8dbccf7
pkgrel=1
pkgdesc="Python package providing Sphinx extensions and a theme for the Julia language"
arch=('any')
url="https://github.com/JuliaLang/JuliaDoc"
license=('GPL')
depends=('python2-sphinx')
makedepends=('git')
provides=('juliadoc')
conflicts=('juliadoc')
source=('git+https://github.com/JuliaLang/JuliaDoc.git')
md5sums=('SKIP')
_gitname=JuliaDoc

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
   python2 setup.py install --root="$pkgdir"
}
