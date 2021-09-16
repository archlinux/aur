# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: CJlano <cjlano+AUR.basiciw@free.fr>

pkgname=python-basiciw
pkgver=0.2.2
pkgrel=2
pkgdesc="Retrieve information such as ESSID or signal quality from wireless cards"
arch=('x86_64')
url="https://github.com/enkore/basiciw"
license=('MIT')
depends=('python' 'wireless_tools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/basiciw/basiciw-$pkgver.tar.gz")
sha256sums=('4bfbe93682727397af144b6bb227fa04a91cd5073dcf8a2bcbd44dba377555aa')

build() {
	cd "basiciw-$pkgver"
	python setup.py build
}

package() {
	cd "basiciw-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	# install -Dm 644 LICENSE
	install -Dm644 README -t "$pkgdir/usr/share/$pkgname/"
}
