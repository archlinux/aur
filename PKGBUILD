# Maintainer: mutantmonkey <aur@mutantmonkey.mx>
pkgname=pyhugh-git
_gitname=pyhugh
pkgver=5.26b0542
pkgrel=4
pkgdesc="Python library for the Hue API",
url="https://github.com/mutantmonkey/pyhugh"
arch=('any')
license=('WTFPL')
depends=('python' 'python-requests>=2.4')
makedepends=('git' 'python-setuptools')
provides=('pyhugh')
conflicts=('pyhugh')
source=('git+https://github.com/mutantmonkey/pyhugh.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd $srcdir/$_gitname
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
