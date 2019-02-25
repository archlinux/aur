# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=knightos-sdk
_pkgname=sdk
pkgver=2.0.9
pkgrel=1
license=('MIT')
pkgdesc='The KnightOS developer SDK'
depends=(
	"python" "python-setuptools" "python-requests" "python-docopt" "genkfs"
	"kpack" "sass" "z80e" "python-yaml" "python-pystache" "kimg" "knightos-kcc"
	"scas"
)
optdepends=(
	"git: version control support"
	"mercurial: version control support"
)
arch=("any")
url='https://github.com/KnightOS/sdk'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('0fd7d1322aa925e06fa595bf52e4a1d04f7661b975d37bb9b78ff481d8ad63bc')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
