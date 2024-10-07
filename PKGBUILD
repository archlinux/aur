# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="rusticlone"
pkgver=1.3.0
pkgrel=2
pkgdesc="3-2-1 backups using Rustic and RClone"
url="https://github.com/AlphaJack/rusticlone"
license=("GPL3")
arch=("any")
depends=("python" "rclone>=1.67.0" "rustic<=0.10.0")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('2df92f9a587ae446f2217260de1598561798ea980a3675f73da0653e921d4dc7690d40a45e8a8ad9f0508a7564872479928b49ce9c13253625f3d98238c92758')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/rusticlone"
}
