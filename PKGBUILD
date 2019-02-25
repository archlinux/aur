# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname="python-haxor"
_pkgname="haxor"
pkgver=1.2.1
pkgrel=1
pkgdesc="Python wrapper for the Hacker News API"
arch=("any")
url="https://pypi.org/project/haxor"
license=("MIT")
depends=("python-requests")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a4341c3f4beb5ba797767af902378b24052bbb6be9e77552b7a9e56ec2002d5e')

build() {
	cd "$_pkgname-$pkgver"
	python ./setup.py build
}

# Upstream test suite segfaults...
#check() {
#	cd "$_pkgname-$pkgver"
#	python ./setup.py test
#}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
