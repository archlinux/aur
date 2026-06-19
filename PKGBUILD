pkgname=python-fipy
pkgver=4.0.3
pkgrel=1
pkgdesc="Partial differential equation solver for Python, based on finite volume approach."
arch=('any')
url="http://www.ctcms.nist.gov/fipy"
license=('NIST-PD-fallback')
makedepends=('python-setuptools' 'python')
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib')
optdepends=('gmsh: creation of irregular meshes')
source=("fipy-$pkgver.tar.gz::https://github.com/usnistgov/fipy/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('742934fda46bade9855297e6d4e3ad1655b782cd1e89e700ffe1980368ad5917')

package() {
   cd "${srcdir}/fipy-${pkgver}"
   python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
   chmod 644 ${pkgdir}/usr/lib/python*/site-packages/FiPy-${pkgver}-py*.egg-info/*
   install -Dm644 "${srcdir}/fipy-${pkgver}/LICENSE.rst" \
     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et tw=0:
