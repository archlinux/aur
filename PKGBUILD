# Maintainer: Byeonghoon Yoo <bh322yoo gmail com>
# Contributor: Byeonghoon Yoo <bh322yoo gmail com>

_author=isac322
_pkgname=tcafe-attending-bot
pkgname=python-${_pkgname}
pkgver=0.1.0
pkgrel=1
pkgdesc='Auto attending bot for TCafe'
arch=('any')
url="https://github.com/$_author/$_pkgname"
license=('MIT')
depends=('python-aiohttp' 'python-beautifulsoup4' 'python-xdg')
makedepends=('python-setuptools')
source=("https://github.com/$_author/$_pkgname/archive/v${pkgver//_/-}.tar.gz")
md5sums=('b34178fae9cec668a3fc60cc021f0740')


build() {
	cd "$_pkgname-${pkgver//_/-}"
	python setup.py build
}

package() {
	cd "$_pkgname-${pkgver//_/-}"

	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
