pkgname=python-ptvsd
pkgver=4.2.5
pkgrel=1
pkgdesc='Python debugger package for use with Visual Studio and Visual Studio Code'
url="https://github.com/Microsoft/ptvsd"
license=('MIT')
arch=(x86_64)
depends=('python' 'python-setuptools')
source=($pkgname-$pkgver.tar.gz::https://github.com/Microsoft/ptvsd/archive/v${pkgver}.tar.gz)
sha512sums=('d52633e1734dd7498eb48eda8d4af50693e0c79e96112c78ed5eccc9f75251817efa7aabd11c9f258babb80181ec85fbff031006549d377b167674b0dff7ed5b')

build() {
  cd ptvsd-$pkgver
  python setup.py build
}

package() {
  cd ptvsd-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
