# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=python2-sourcemap-git
pkgver=r62.95ebb1f
pkgrel=1
pkgdesc="Parse JavaScript source maps."
arch=('any')
url="https://github.com/mattrobenolt/python-sourcemap"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!emptydirs)
source=("${pkgname%-git}::git+https://github.com/mattrobenolt/python-sourcemap")
md5sums=('SKIP')

_gitroot=https://github.com/mattrobenolt/python-sourcemap
_gitname=python2-sourcemap

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
