# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=python-globus-cli
pkgver=2.1.0.r97.gc0fa9e3
pkgrel=1
pkgdesc='CLI for Globus'
arch=('any')
url="https://globus.github.io/globus-cli"
license=('Apache')
depends=(
	'python-globus-sdk=3.0.1'
	'python-click>=8.0.0'
	'python-click<9'
	'python-jmespath=0.10.0'
	'python-requests>=2.0.0'
	'python-requests<3.0.0'
	'python-cryptography>=1.8.1'
	'python-cryptography<35.0.0')
makedepends=('python-setuptools' 'git')
provides=('globus-cli')
changelog=changelog.adoc
## upstream updated dependencies without releasing a new version
source=("$pkgname-$pkgver::git+https://github.com/globus/globus-cli#commit=c0fa9e38341927303be41acea27825a70a5dc6ce?signed")
sha256sums=('SKIP')
validpgpkeys=('FC694E40DC03A8B702D96372CF7E843C41E814C9')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
