# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=('python-sentry_sdk' 'python2-sentry_sdk')
pkgbase=python-sentry_sdk
_pkgname=sentry-sdk
pkgver=0.7.2
pkgrel=1
pkgdesc="The new Python SDK for Sentry.io"
arch=('i686' 'x86_64')
url="https://github.com/getsentry/sentry-python"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/getsentry/sentry-python/master/LICENSE")
md5sums=('81f79aa6b6c9de491e8c8f9dc3994ffd'
         '0c79f8d3c91fc847350efd28bfe0a341')

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
