# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=python2-commando-git
pkgver=r30.78dc9f2
pkgrel=1
pkgdesc="A simple wrapper for argparse that allows commands and arguments to be defined declaratively using decorators."
arch=('any')
url="https://github.com/hyde/commando"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!emptydirs)
source=("${pkgname%-git}::git+https://github.com/hyde/commando")
md5sums=('SKIP')

_gitroot=https://github.com/hyde/commando
_gitname=python2-commando

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
