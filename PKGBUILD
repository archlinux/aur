# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-opentimestamps"
pkgver=0.5.0
pkgrel=1
pkgdesc="Python3 library for creating and verifying OpenTimestamps proofs"
arch=("any")
url="https://github.com/opentimestamps/python-opentimestamps"
license=("LGPL-3.0-or-later")
depends=("python" "python-bitcoinlib" "python-pycryptodomex")
optdepends=("python-gitpython: timestamp git commits")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/python-opentimestamps-v$pkgver.tar.gz")
sha256sums=('71da89eb68cdb0eb67f3ee932b6d743ca14c43648911b04551b04afdbcb1c703')

build(){
 cd "python-opentimestamps-python-opentimestamps-v$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "python-opentimestamps-python-opentimestamps-v$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
