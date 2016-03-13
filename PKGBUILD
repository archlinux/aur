# Maintainer: Dylan Whichard <dylan at whichard dot com>
_name=Flask-aiohttp
_owner=dylwhich
pkgname=python-flask-aiohttp-git
pkgver=8.152e71e
pkgrel=1
pkgdesc="Asynchronous Flask using aiohttp."
arch=('any')
url="https://github.com/$_owner/$_name"
license=('MIT')
depends=('python>=3.4' 'python-aiohttp>=0.15' 'python-flask>=0.10.0')
provides=('python-flask-aiohttp')
conflicts=('python-flask-aiohttp')
options=(!emptydirs)
source=("git+https://github.com/$_owner/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
