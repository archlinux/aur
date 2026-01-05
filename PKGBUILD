# Maintainer: Storm Dragon <storm_dragon@stormux.org>
pkgname=python-libloader
_pkgname=libloader
pkgver=1.4.2
pkgrel=1
pkgdesc="Quickly and easily load shared libraries from various platforms. Also includes a libloader.com module for loading com modules on Windows."
arch=('any')
url="https://pypi.org/project/libloader/"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('bc4bf9e19fef811b52d383370f890f417cb911296c1645b1b66761b9b20a3281ec157d3eb4c6926c9433fa99f962f0ae9e37c9c9f82f36553904a512f6f7d3d2')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
