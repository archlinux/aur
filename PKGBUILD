# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-clipboard
_name=${pkgname#python-}
pkgver=0.0.4
pkgrel=1
pkgdesc="A cross platform clipboard operation Python library."
arch=('any')
url="https://github.com/terryyin/clipboard"
license=('MIT')
depends=('python-pyperclip')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a72a78e9c9bf68da1c3f29ee022417d13ec9e3824b511559fd2b702b1dd5b817')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
