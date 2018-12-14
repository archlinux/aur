# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname=python2-sentry_sdk
_pkgname=sentry-sdk
pkgver=0.6.2
pkgrel=1
pkgdesc="The new Python SDK for Sentry.io"
arch=('i686' 'x86_64')
url="https://github.com/getsentry/sentry-python"
license=('BSD')
depends=('python2-urllib3' 'python2-certifi')
makedepends=('python2-setuptools')
optdepends=('python2-flask')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/sentry-sdk-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/getsentry/sentry-python/master/LICENSE")
md5sums=('78642322818c1ce47e80938fe1f40b5f'
         '0c79f8d3c91fc847350efd28bfe0a341')

build() {
	cd "$_pkgname-$pkgver"
    python2 setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
