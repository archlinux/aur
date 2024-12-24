# Maintainer: icepie, icepie.dev@gmail.com

pkgname=bt-dualboot
_pkgname=bt_dualboot
pkgver=1.0.1
pkgrel=3
pkgdesc="Sync Bluetooth for dualboot Linux and Windows"
arch=('any')
url="https://github.com/x2es/bt-dualboot"
license=('GPL-3.0-only')
makedepends=('git' 'python-installer' 'python-wheel' 'python-build' 'python-poetry')
depends=('python' 'chntpw')
source=("git+$url.git#tag=v${pkgver}")
sha256sums=('d75ea4caf3c77df2d4c8c48a14c915514a4480fea0324275f8322e1ade64247d')


build(){
	cd $pkgname
	python -m build --wheel --no-isolation
}

package() {
	cd $pkgname
	python -m installer --destdir="$pkgdir" dist/*.whl
}
