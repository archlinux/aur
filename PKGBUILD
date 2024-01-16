# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkdocs-backlinks-plugin"
_pkgname="${pkgname%-plugin}"
pkgver=0.9.1
pkgrel=1
pkgdesc="A plugin for adding backlinks to mkdocs"
url="https://github.com/danodic-dev/mkdocs-backlinks"
license=("MIT")
arch=("any")
depends=("mkdocs" "python-beautifulsoup4")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('fa474e0cc320683d51876f2f68bb709a37d76d4ca603f8374a7e991a94ee8229866c8bd6eb724f6d1e45e022f2d8a2e5d665fdf4f3ad1eb9a0209ba3d1abb728')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
