# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-pyzm
pkgver=0.3.64.g043e304
pkgrel=1
pkgdesc='Python API, Log, Event Server and Memory wrapper for ZoneMinder'
arch=('any')
url='https://github.com/ZoneMinder/pyzm'
license=('GPL-2.0-only')
depends=('python-dateparser' 'python-dotenv' 'python-imutils' 'python-mysql-connector' 'python-numpy' 'python-pillow' 'python-portalocker'
         'python-progressbar' 'python-psutil' 'python-requests' 'python-shapely' 'python-sqlalchemy' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=('https://github.com/ZoneMinder/pyzm/archive/043e304131394ad407fb01144f1ce8ac6f4f9898.zip')
sha256sums=('9974a43327924795ed94364288fe3d157f02ba55e84e6a62985369c27f2eb64c')

prepare() {
    cd pyzm-043e304131394ad407fb01144f1ce8ac6f4f9898

    sed -i "s|/etc/zm|/etc/zoneminder|" pyzm/ZMLog.py
}

build() {
    cd pyzm-043e304131394ad407fb01144f1ce8ac6f4f9898

    python -m build --wheel --no-isolation
}

package() {
    cd pyzm-043e304131394ad407fb01144f1ce8ac6f4f9898

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
