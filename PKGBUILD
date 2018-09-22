# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python-subprocess2'
pkgver=2.0.2
pkgrel=3
pkgdesc="Extensions to the upstream python subprocess module"
arch=('any')
license=('LGPLv2')
url="http://github.com/kata198/python-subprocess2"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')

source=("https://github.com/kata198/python-subprocess2/archive/${pkgver}.tar.gz")
sha512sums=('910545ac2444bc25f2a6a1ac080e9508f934a35dfdd7866568adf53105263da59893939541654724f0413331d48f8f12110db2ce89a618d4dd6fd7472d48c496')

build() {
  cd "$srcdir"/python-subprocess2-$pkgver
  python setup.py build

}

package() {
  cd python-subprocess2-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

