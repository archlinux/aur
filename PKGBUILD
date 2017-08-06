# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-s3fs
_pkgname=s3fs
pkgver=0.1.2
pkgrel=1
pkgdesc="A python file interface to S3."
arch=('any')
url="https://github.com/dask/s3fs"
license=('BSD')
depends=('python' 'python-boto3')
checkdepends=('python-moto')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/dask/s3fs/archive/$pkgver.tar.gz")
sha256sums=('299e072d081a4883dc4863d7ea1528dd3dafdfa8bd7a88fbeb6aa8ab25e95251')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  py.test
}
# vim:ts=2:sw=2:et:
