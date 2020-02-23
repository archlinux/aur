_pkgname=starlette
pkgname=python-starlette
pkgver=0.13.2
pkgrel=1
pkgdesc="Starlette is a lightweight ASGI framework/toolkit, which is ideal for building high performance asyncio services."
arch=('any')
url="https://www.starlette.io/"
license=('BSD')
depends=('python' 'python-setuptools')
_name=${pkgname#python-}

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('e00fce31cb3d525d2c2f31be5de168ef')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
