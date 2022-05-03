pkgname=pypy3-beniget
pkgver=0.4.1
pkgrel=1
pkgdesc='A static analyzer for Python code'
arch=(any)
url='https://github.com/serge-sans-paille/beniget'
license=(BSD)
depends=(pypy3-gast)
makedepends=(pypy3-setuptools)
source=(https://files.pythonhosted.org/packages/source/b/beniget/beniget-$pkgver.tar.gz)
sha256sums=('75554b3b8ad0553ce2f607627dad3d95c60c441189875b98e097528f8e23ac0c')

build() {
  cd beniget-$pkgver
  pypy3 setup.py build
}

package() {
  cd beniget-$pkgver
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
