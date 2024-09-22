# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="rusticlone"
pkgver=1.2.1
pkgrel=1
pkgdesc="3-2-1 backups using Rustic and RClone"
url="https://github.com/AlphaJack/rusticlone"
license=("GPL3")
arch=("any")
depends=("python" "rclone>=1.67.0" "rustic>=0.8.0")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('feff21bc5811b340bd8219f302db599172b932a21b105fbaf806353f765f58963eccc48c941c51de1a6bc0374f2095e8c5e8d153ad45d0c46a640c0ba24687ce')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/rusticlone"
}
