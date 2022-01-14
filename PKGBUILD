# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=globus-cli
pkgver=3.2.0
pkgrel=1
pkgdesc='CLI for Globus'
arch=('any')
url="https://globus.github.io/globus-cli"
license=('Apache')
depends=(
	'python-globus-sdk'
	'python-click'
	'python-jmespath=0.10.0'
	'python-requests'
	'python-cryptography')
makedepends=('python-setuptools' 'git')
replaces=('python-globus-cli')
changelog=changelog.adoc
source=("$pkgname::git+https://github.com/globus/globus-cli#tag=$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('FC694E40DC03A8B702D96372CF7E843C41E814C9')

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
