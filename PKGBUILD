# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="rusticlone"
pkgver=1.1.0
pkgrel=1
pkgdesc="3-2-1 backups using Rustic and RClone"
url="https://github.com/AlphaJack/rusticlone"
license=("GPL3")
arch=("any")
depends=("python" "rustic>=0.7.0" "rclone>=1.67.0")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('f1323f716648d84b640fccea6829bf878f3b4377259b5394beb5c6ee341c8c6eef4ee3adbe7d9b7767d5fa9fea7eb4b514396d0498b93a0802cbcf45233e1326')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/rusticlone"
}
