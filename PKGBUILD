# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=linxpy-git
_gitname=linxpy
pkgver=20.751b9ac
pkgrel=1
pkgdesc="A Python client for linx.li."
url="https://github.com/mutantmonkey/linxpy"
arch=('any')
license=('WTFPL')
depends=('python' 'python-requests>=2.4')
makedepends=('git')
provides=('linxpy')
conflicts=('linxpy')
source=('git+https://github.com/mutantmonkey/linxpy.git')
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
