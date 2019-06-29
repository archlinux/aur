pkgname=python-pyhelm
pkgver=0.1.5
pkgrel=1
pkgdesc="Python bindings for Helm"
url=https://github.com/flaper87/pyhelm
license=('APACHE')
_name=${pkgname#python-}
source=("${_name}-${pkgver}.zip::https://github.com/flaper87/pyhelm/archive/${pkgver}.zip")
source=("https://files.pythonhosted.org/packages/source/p/pyhelm/pyhelm-${pkgver}.tar.gz")
sha256sums=('ff389eb0888ee3f90c84e3f4d6eb3f6d0a8c339f9debc907bae65ba5f670a772')
arch=('any')
makedepends=('python-setuptools')
depends=(
  python-gitpython
  python-grpcio
  python-grpcio-tools
  python-protobuf
  python-supermutes
  python-requests
  python-pyaml
  python-boto3
  python-botocore
)

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
