# Maintainer: Storm Dragon <storm_dragon@stormux.org>
pkgname=python-libloader
_pkgname=libloader
pkgver=1.3.1
pkgrel=1
pkgdesc="Quickly and easily load shared libraries from various platforms. Also includes a libloader.com module for loading com modules on Windows."
arch=('any')
url="https://pypi.org/project/libloader/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('4ae8d23626ee283274276b7ed90a9d849d44183bff450d3fcaee870f9ae44c5b1bdbe632c29b8e64d7d7f4ad84d4aa4e0500ae7a23ed6708c36346609a16e674')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
