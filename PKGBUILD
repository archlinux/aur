# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-bayesicfitting
_pyname=BayesicFitting
pkgname=("python-bayesicfitting")
#"python-${_pyname}"-doc)
pkgver=3.2.4
pkgrel=1
pkgdesc="A Python Toolbox for Bayesian fitting"
arch=('any')
url="https://github.com/dokester/BayesicFitting"
license=('GPL-3.0-or-later')
makedepends=('python-setuptools')
#            'python-wheel'
#            'python-build'
#            'python-installer'
#checkdepends=('python-astropy'
#              'python-matplotlib'
#              'python-scipy'
#              )
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('d60dfa14c02f4722b704169143247f7ea4e5ffbca04728461df49a29298fa4c8')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make SPHINXOPTS="" -C doc html

}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    rm ${_pyname}/test/TestModifiable.py
#    rm ${_pyname}/test/TestNestedSolver.py
#    PYTHONPATH="${_pyname}/test" python -m unittest ${_pyname}/test/* -v #|| warning "Tests failed" # discover -v
#}

package_python-bayesicfitting() {
    depends=('python-astropy>=2.0'
             'python-matplotlib>=2.0'
             'python-scipy>=1.0'
             'python-future')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-bayesicfitting-doc() {
#    pkgdesc="Documentation for Python echo module"
#    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
