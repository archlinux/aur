# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="rusticlone"
pkgver=1.6.1
pkgrel=1
pkgdesc="3-2-1 backups using Rustic and RClone"
url="https://github.com/AlphaJack/rusticlone"
license=("GPL-3.0-or-later")
arch=("any")
depends=("python" "rclone>=1.67.0" "rustic>=0.10.0" "rustic<0.12.0" "python-importlib-metadata" "python-configargparse")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('6831712ee9799c6e712965050f86cb343bc2c4aa6ee2fba51790b23688b313681d46805c30dc60390fa41ebca35393f145c7a0fe3b07be53554353c1191c6daa')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/rusticlone"
}
