# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-s3fs
_pkgname=s3fs
pkgver=0.3.3
pkgrel=1
pkgdesc="A python file interface to S3."
arch=('any')
url="https://github.com/dask/s3fs"
license=('BSD')
depends=('python' 'python-boto3' 'python-fsspec')
checkdepends=('python-moto' 'python-pytest')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/dask/s3fs/archive/$pkgver.tar.gz")
sha256sums=('06ccf2f5ba5fadaabd92c153ed9f84a84ebc590038049a395ca70733c1bf61f0')

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
