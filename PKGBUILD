# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="rusticlone"
pkgver=1.6.1.post1
pkgrel=1
pkgdesc="3-2-1 backups using Rustic and RClone"
url="https://github.com/AlphaJack/rusticlone"
license=("GPL-3.0-or-later")
arch=("any")
depends=("python" "rclone>=1.67.0" "rustic>=0.10.0" "rustic<0.12.0" "python-importlib-metadata" "python-configargparse")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('651024ece753244fa17da6db4ad7e06d94521aa9f6c9e9df96666fc86f381f7f7f5361cd33ab773ad93438e3f333810861e5ed3c909b6bdca0713c1a92fdd887')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/rusticlone"
}
