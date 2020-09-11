# Maintainer: Kevin Andriessens <kevin@kelaun.be>
pkgname='python-aiohttp_rpc'
_pkgname='aiohttp-rpc'
pkgver='0.6.3'
pkgrel=2
pkgdesc="Library for integrating JSON-RPC 2.0 protocol with python-aiohttp"
arch=('x86_64')
url="https://github.com/expert-m/aiohttp-rpc"
license=('MIT')
depends=('python>=3.7.0')
makedepends=('tar' 'python-aiohttp>=3.0.0' 'python-aiohttp<4.0.0' 'python-setuptools')
source=("$pkgname-v$pkgver.tar.gz::https://files.pythonhosted.org/packages/6d/a8/6b3077d5291e6a618bd48562be29341c7e28f77652799b18ac630b0aea59/$_pkgname-$pkgver.tar.gz")
sha256sums=('b518fb236bcd691319b1a99beaba209a5ac6e2449b98b4604cea70ef9c875af9')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	cd ../../
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
