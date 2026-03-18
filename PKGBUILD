# Maintainer: Arnob <arnob8066@gmail.com>
pkgname=wsconnect
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast fzf-based selector for Windscribe VPN"
arch=('any')
url="https://github.com/Arnob90/wsconnect"
license=('MIT')
depends=('python-typer' 'fzf' 'windscribe-cli-v2-bin')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee72bc14c5a0c0eb8f3ef7f9601a10b4c0818ccfa19253dbf1b74e2bbb428acf')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
