# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=python2-fswrap-git
pkgver=r16.41e4ad6
pkgrel=1
pkgdesc="An opinionated wrapper on file system and path functions."
arch=('any')
url="https://github.com/hyde/fswrap"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!emptydirs)
source=("${pkgname%-git}::git+https://github.com/hyde/fswrap")
md5sums=('SKIP')

_gitroot=https://github.com/hyde/fswrap
_gitname=python2-fswrap

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
