# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pylnk303
_pkgname=pylnk3
pkgver=0.3.0
pkgrel=2
pkgdesc="Python library for reading and writing Windows shortcut files (.lnk).(0.3 ver)"
url="https://pypi.org/project/pylnk3/"
arch=('any')
provides=('python-pylnk3=0.3.0')
conflicts=('python-pylnk3')
license=('LGPLv3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6202a2b4bd9c6efe6d070dd9d93d501702f48f27d4873e2dfddc8d996499b684')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
