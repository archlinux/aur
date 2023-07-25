# Maintainer: Alessio <alessio at linux dot com>

pkgbase=python-neosctl
_pyname=neosctl
pkgname=("${pkgbase}")
pkgver=0.9.1
pkgrel=1
pkgdesc="Meosctl for management of neos services via CLI "
arch=('any')
url="https://pypi.org/project/neosctl/"
license=('custom')
depends=('python-poetry-core')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-poetry' 'python-poetry-core')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=(SKIP)

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation
}

package_python-neosctl() {

    depends=('python-poetry-core')
    provides=('python-neosctl')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
