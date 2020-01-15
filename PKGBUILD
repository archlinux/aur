# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-mlflow
pkgver=1.5.0
pkgrel=2
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
    'python-gorilla' 'python-prometheus-flask-exporter')
optdepends=('python-scikit-learn' 'python-boto3' 'python-mleap'
    'python-azure-storage' 'python-google-cloud-storage')
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/mlflow/mlflow/archive/v$pkgver.tar.gz")
sha256sums=('edef1e24ad947ee286a90cbd45b635234a1cad6961fe507d1c38a58ee47f4a08')

_pkgname=mlflow

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
