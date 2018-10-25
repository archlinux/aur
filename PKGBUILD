# Maintainer: cclin <cclinet@outlook.com>
 
pkgbase=python-aiofiles
pkgname=('python-aiofiles')
pkgver=0.4.0
pkgrel=1
pkgdesc='an Apache2 licensed library, written in Python, for handling local disk files in asyncio applications.'
arch=('any')
license=('Apache 2.0')
url='https://github.com/Tinche/aiofiles'
makedepends=('python-setuptools')
checkdepends=('python-tox' 'python-coverage' 'python-pytest-asyncio' 'python-pytest' 'python-pytest-cov')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Tinche/aiofiles/archive/v$pkgver.tar.gz")
sha512sums=('9e1f8b2beb3ca2996b35de9281ceafbb8ccdeab4b213f9605cb5908558c5f495d1cf4481ac229ca44bb236ad99826d89d137ec6ac4386c23b6e056b657a6bf4a')

build() {
  cd "$srcdir"/aiofiles-$pkgver
  python setup.py build
}
 
check() {
  cd "$srcdir"/aiofiles-$pkgver
  tox -e py36
}
 
package_python-aiofiles(){
 
  depends=('python')
 
  cd aiofiles-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

