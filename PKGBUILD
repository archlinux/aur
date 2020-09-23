# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ufodiff
pkgver=1.0.2
pkgrel=1
pkgdesc='UFO source file diff application'
arch=(any)
url="https://github.com/source-foundry/$pkgname"
license=('MIT')
depends=('python' 'python-commandlines' 'python-gitdb' 'python-gitpython>=3.1.5' 'python-smmap' 'python-standardstreams')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3d90cfc11d12a85d29fb38eb78aa7df2915b2d8191cb57b04a21b495cb85edba')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
