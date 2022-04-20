_pkgname="gofile-client"
pkgname="python-$_pkgname"
pkgver=1.0.1
pkgrel=2
pkgdesc="A wrapper around the gofile.io API"
arch=('any')
depends=('python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/rdnkarchiver/gofile-client"
license=('Apache')

source=("https://files.pythonhosted.org/packages/source/g/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("1cc54630f1f4cbc09654ded012b4a5cd4992aa6ee67442dbba873edd63d01eff")

build(){
    cd $_pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $_pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
