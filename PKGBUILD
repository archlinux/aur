# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-sentry_sdk
_name=sentry-sdk
pkgver=0.15.0
pkgrel=1
pkgdesc="The new Python SDK for Sentry.io"
arch=('any')
url="https://sentry.io/for/python"
license=('BSD')
depends=('python-urllib3' 'python-certifi')
makedepends=('python-setuptools')
optdepends=('python-flask' 'python-blinker' 'python-bottle' 'python-falcon' 'python-django'
            'python-sanic' 'python-celery' 'python-beam' 'python-rq' 'python-aiohttp'
            'python-tornado' 'python-sqlalchemy' 'python-pyspark')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c24428f04eb7fc77c6f2a4d32c58656bf347855b39930dc8947384226ac55daa')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
