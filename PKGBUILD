# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-sentry_sdk
_name=sentry-sdk
pkgver=1.20.0
pkgrel=1
pkgdesc="The new Python SDK for Sentry.io"
arch=('any')
url="https://sentry.io/for/python"
license=('BSD')
depends=('python-urllib3' 'python-certifi')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-aiohttp: adds support for the AIOHTTP-Server Web Framework'
            'python-apache-beam: experimental BeamIntegration'
            'python-arq: Arq integration'
            'python-bottle: adds support for the Bottle Web Framework'
            'python-celery: adds support for the Celery Task Queue System'
            'python-chalice: for the Chalice web framework for AWS Lambda'
            'python-django: adds support for the Django Web Framework'
            'python-falcon: adds support for the Falcon Web Framework'
            'python-fastapi: adds support for the FastAPI framework'
            'python-flask: adds support for the Flask Web Framework'
            'python-grpcio: gRPC integration'
            'python-httpx: HTTPX integration'
            'python-huey: Huey Integration'
            'python-multipart: Optional dependency of Starlette to parse form data'
            'python-opentelemetry-distro: adds support for OpenTelemetry'
            'python-pymongo: PyMongo integration'
            'python-pyramid: adds support for the Pyramid Web Framework'
            'python-pyspark: adds support for the Python API for Apache Spark'
            'python-quart: adds support for the Quart Web Framework'
            'python-redis: adds support for the RQ Job Queue System'
            'python-rq: adds support for the RQ Job Queue System'
            'python-sanic: adds support for the Sanic Web Framework'
            'python-sqlalchemy: captures queries from SQLAlchemy as breadcrumbs'
            'python-starlette: adds support for the Starlette Framework'
            'python-starlite: adds support for the Starlite Framework'
            'python-tornado: adds support for the Tornado Web Framework'
            'python-trytond: adds support for the Tryton Framework Server'
            'python-pure_eval: for richer stacktraces & additional variables'
            'python-executing: for richer stacktraces & better function names')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a3410381ae769a436c0852cce140a5e5e49f566a07fb7c2ab445af1302f6ad89')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
