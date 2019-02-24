# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=('python-sentry_sdk' 'python2-sentry_sdk')
pkgbase=python-sentry_sdk
_pkgname=sentry-sdk
pkgver=0.7.3
pkgrel=1
pkgdesc="The new Python SDK for Sentry.io"
arch=('i686' 'x86_64')
url="https://github.com/getsentry/sentry-python"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/getsentry/sentry-python/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/getsentry/sentry-python/master/LICENSE")
sha256sums=('6f4e264d0ad6267c40e20431a6a50f815515805ffe8eb9815340adf931279523'
            '59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c')

package_python-sentry_sdk() {
	depends=('python-urllib3' 'python-certifi')
	optdepends=('python-flask' 'python-blinker')

	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-sentry_sdk() {
	depends=('python2-urllib3' 'python2-certifi')
	optdepends=('python2-flask' 'python2-blinker')

	cd "$_pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
