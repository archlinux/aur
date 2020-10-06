# Maintainer: Lorenzo Gaifas <brisvag@gmail.com>

pkgname=python-justpy
pkgver=0.1.4
pkgrel=2
pkgdesc="An object oriented high-level Python Web Framework that requires no front-end programming"
arch=('any')
license=('Apache')
url="https://justpy.io/"
depends=('python' 'python-starlette' 'uvicorn' 'python-itsdangerous' 'python-jinja' 'python-addict' 'demjson' 'python-httpx' 'python-aiofiles')
makedepends=('python-setuptools' 'cython')
source=("justpy-$pkgver.tar.gz::https://github.com/elimintz/justpy/archive/v$pkgver.tar.gz")
sha512sums=('7572f8ea210357e13049229629394ac60fe44ec8772c2a65d99adaaa5bbd3b760eaff6acefad17a0c12e73744b0665878d81b2882d2757f8d98e7da13cb305d9')

build() {
  cd $srcdir/justpy-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/justpy-$pkgver
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
