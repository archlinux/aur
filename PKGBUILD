# Maintainer: A Farzat <a@farzat.xyz>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=pip-autoremove
pkgname="$_pkgname"
pkgver=0.10.0
pkgrel=1
pkgdesc="Remove a package and its unused dependencies."
url="https://github.com/invl/pip-autoremove"
depends=(python-pip python-setuptools)
makedepends=(python-build python-installer python-wheel)
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=(517d91f5017a1881baeb7b9bd015d116)


build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
