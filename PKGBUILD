# Maintainer: Ian Glen <ian@ianglen.me>

pkgname=geda-symbols-improved-git
_gitname=geda-symbols-improved
pkgver=24.986201d
pkgrel=1
pkgdesc="A better symbol library for gEDA. Smaller, more consistent, and more readable."
arch=('any')
url='https://github.com/codeThatThinks/geda-symbols-improved'
license=('custom:CC0')
depends=('geda-gaf')
optdepends=()
makedepends=('git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=('git+https://github.com/codeThatThinks/geda-symbols-improved.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  install -d -m 755 "$pkgdir"/usr/share/gEDA/sym-improved
  cd $srcdir/$_gitname/sym-improved
  cp -r . "$pkgdir"/usr/share/gEDA/sym-improved/
}
