# Maintainer: Chris Snell <chris dot snell at gmail.com>

pkgname=python-okta-legacy
_upstream_name=okta
pkgver=0.0.4
pkgrel=1
pkgdesc='Python SDK for managing Okta instances, pre-1.0 version'
arch=('any')
url="https://github.com/okta/okta-sdk-python"
depends=('python-requests' 'python-dateutil' 'python-six')
makedepends=('python-setuptools' 'git')
provides=("python-okta=$pkgver")
conflicts=('python-okta')
source=("https://files.pythonhosted.org/packages/source/o/okta/okta-$pkgver.tar.gz")
sha1sums=('152715bef918b10f6b8c420b2c89a7c4d44a6f3a')


build() {
	cd "okta-$pkgver"
	python setup.py build
}

package() {
	cd "okta-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
