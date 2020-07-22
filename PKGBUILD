# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-sentry_sdk
_name=sentry-sdk
pkgver=0.16.2
pkgrel=1
pkgdesc="The new Python SDK for Sentry.io"
arch=('any')
url="https://sentry.io/for/python"
license=('BSD')
depends=('python-urllib3' 'python-certifi')
makedepends=('python-setuptools')
optdepends=('python-flask: adds support for the Flask Web Framework'
            'python-bottle: adds support for the Bottle Web Framework'
            'python-falcon: adds support for the Falcon Web Framework'
            'python-django: adds support for the Django Web Framework'
            'python-sanic: adds support for the Sanic Web Framework'
            'python-celery: adds support for the Celery Task Queue System'
            'python-apache-beam: experimental BeamIntegration'
            'python-rq: adds support for the RQ Job Queue System'
            'python-aiohttp: adds support for the AIOHTTP-Server Web Framework'
            'python-tornado: adds support for the Tornado Web Framework'
            'python-sqlalchemy: captures queries from SQLAlchemy as breadcrumbs'
            'python-pyspark: adds support for the Python API for Apache Spark'
            'python-pure_eval: for richer stacktraces & additional variables'
            'python-executing: for richer stacktraces & better function names')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('38bb09d0277117f76507c8728d9a5156f09a47ac5175bb8072513859d19a593b')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
