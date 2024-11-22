# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="rusticlone"
pkgver=1.4.0
pkgrel=2
pkgdesc="3-2-1 backups using Rustic and RClone"
url="https://github.com/AlphaJack/rusticlone"
license=("GPL3")
arch=("any")
depends=("python" "rclone>=1.67.0" "rustic<=0.10.0" "python-importlib-metadata" "python-configargparse")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('9d992bb410be0cbe25b703fbf8950bdce5c25edbe4d878ca0fbfcbae0713c4db7f22ad5d5f07a904f203ab4e9d05e9c167d0e50203d1ae1f8393ab3543fd31b8')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/rusticlone"
}
