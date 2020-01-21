# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-sentry_sdk
_name=sentry-sdk
pkgver=0.14.1
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
#source=("https://github.com/getsentry/sentry-python/archive/$pkgver.tar.gz")
sha256sums=('e023da07cfbead3868e1e2ba994160517885a32dfd994fc455b118e37989479b')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
