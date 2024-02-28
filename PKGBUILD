
# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
_name=gitvenv
pkgname=python-$_name
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple tool to create virtual git environments (like a python's venv)."
arch=('any')
url='https://gitlab.com/yataro/gitvenv/'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-wheel' 'python-installer')
source=("https://gitlab.com/yataro/$_name/-/archive/v$pkgver/$_name-v$pkgver.tar.gz")
sha256sums=('baf78940447796605fc853c3eccf514ed1ea089065698e031c89278d220ecc86')



build() {
    cd "$_name-v$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
