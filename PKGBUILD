# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pytest-recording
_pkgname=${pkgname:7}
pkgver=0.12.1
pkgrel=1
pkgdesc="A pytest plugin that allows you recording of network interactions via VCR.py"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-vcrpy python python-pytest python-attrs)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('0d1f36d10dea5090cab8ecd230e5dc937c97b9fed193874b330d2926ddea028f')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
