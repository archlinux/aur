# Maintainer: Ian Glen <ian@ianglen.me>

pkgname=geda-better-symbols-git
_gitname=geda-better-symbols
pkgver=24.986201d
pkgrel=1
pkgdesc="A better symbol library for gEDA. Smaller, more consistent, and more readable."
arch=('any')
url='https://github.com/codeThatThinks/geda-better-symbols'
license=('custom:CC0')
depends=('geda-gaf')
optdepends=()
makedepends=('git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=('git+https://github.com/codeThatThinks/geda-better-symbols.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  install -d -m 755 "$pkgdir"/usr/share/gEDA/sym-better
  cd $srcdir/$_gitname/sym-better
  cp -r . "$pkgdir"/usr/share/gEDA/sym-better/
}
