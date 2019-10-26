# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-mlflow
pkgver=1.3.0
pkgrel=1
pkgdesc='An open source platform for the machine learning lifecycle'
arch=('x86_64')
url='https://mlflow.org'
license=('Apache-2.0')
depends=('python' 'python-alembic' 'python-click' 'python-cloudpickle'
    'python-databricks-cli' 'python-requests' 'python-six' 'gunicorn'
    'python-flask' 'python-numpy' 'python-pandas' 'python-dateutil'
    'python-protobuf' 'python-gitpython' 'python-pyaml'
    'python-querystring-parser' 'python-simplejson'
    'python-docker' 'python-entrypoints' 'python-sqlparse' 'python-sqlalchemy'
    'python-gorilla')
optdepends=('python-scikit-learn' 'python-boto3' 'python-mleap'
    'python-azure-storage' 'python-google-cloud-storage')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/mlflow/mlflow/archive/v$pkgver.tar.gz")
sha256sums=('9d727a6f67a5139c7990acdcd353e3887579b0a606afe9338805910cf0b14b52')

_pkgname=mlflow

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
