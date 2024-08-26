# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="rusticlone"
pkgver=1.1.1
pkgrel=1
pkgdesc="3-2-1 backups using Rustic and RClone"
url="https://github.com/AlphaJack/rusticlone"
license=("GPL3")
arch=("any")
depends=("python" "rustic=0.7.0" "rclone>=1.67.0")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('7844b2166cdd85008a357b9eddfb5d5a1697c275cdcda597e0dfacf0b5bdcb492ed28c2347cc095e6e210fe8952a2caf7a513dfa5d47a92848ff93fb8880804d')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/rusticlone"
}
