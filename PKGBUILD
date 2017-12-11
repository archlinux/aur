# Maintainer: cclin <cclinet@outlook.com>
 
pkgbase=python-aiofiles
pkgname=('python-aiofiles')
pkgver=0.3.2
pkgrel=1
pkgdesc='an Apache2 licensed library, written in Python, for handling local disk files in asyncio applications.'
arch=('any')
license=('Apache 2.0')
url='https://github.com/Tinche/aiofiles'
makedepends=('python-setuptools')
checkdepends=('python-tox' 'python-coverage' 'python-pytest-asyncio' 'python-pytest' 'python-pytest-cov')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Tinche/aiofiles/archive/v$pkgver.tar.gz")
sha512sums=('162d66753ef4fb15279150b7fa953b4ecf086e2b36cc77531dac099ff4a25b3458af627bdf52e168b7b4b2163a1445f35c2c656b1c10c0c73502d2357ba42dd8')
 
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

sha512sums=('8d97282716b6a603b265a8ebcf405ca6a8080a61cf42119bba0361488c864b765a34977da99497fb5ef6fe975065e186760bb01a550ca95b1f35ef9a1be9e914')
