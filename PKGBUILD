# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="rusticlone"
pkgver=1.6.0
pkgrel=1
pkgdesc="3-2-1 backups using Rustic and RClone"
url="https://github.com/AlphaJack/rusticlone"
license=("GPL-3.0-or-later")
arch=("any")
depends=("python" "rclone>=1.67.0" "rustic>=0.10.0" "rustic<0.11.0" "python-importlib-metadata" "python-configargparse")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c87ac32999468da775d6d5ae8ee33a2f3ea1d9007cfdcaba85cdde09d630a327e8db47ddd2183bce1687ef573d9f5cebdf8f658a1846cb5b5bd70c58ff3881b9')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/rusticlone"
}
