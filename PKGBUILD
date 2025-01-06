# Maintainer: Eragon <eragon at eragon dot re>

_name=flask-crontab
pkgname=python-flask-crontab
pkgver=0.1.2
pkgrel=3
pkgdesc="Simple Flask scheduled tasks without extra daemons"
arch=('any')
url="https://github.com/frostming/flask-crontab"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-flask')
source=("$_name-$pkgver.tar.gz::https://github.com/frostming/flask-crontab/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('177b32f222b08b446382aab76b91d2ed4273313b6703bff00f553e5aad96c420')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

