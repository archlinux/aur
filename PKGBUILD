# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python-pytest-astropy
_pyname=${pkgname#python-}
pkgver=0.9.0
pkgrel=1
pkgdesc="Metapackage for all the testing machinery used by the Astropy Project"
arch=('any')
url="https://github.com/astropy/pytest-astropy"
license=('BSD')
depends=('python>=3.7' 'python-pytest>=4.6' 'python-pytest-doctestplus>=0.11.0' 'python-pytest-remotedata>=0.3.1' 'python-pytest-openfiles>=0.3.1' 'python-pytest-arraydiff>=0.1' 'python-pytest-astropy-header>=0.1.2' 'python-pytest-filter-subpackage>=0.1' 'python-pytest-cov>=2.0' 'python-hypothesis>=5.1')
makedepends=('python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('63d99a983d21db297246ae01e83f874b')

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
