pkgname='python-hmms'
_name='hmms'
pkgver=0.2.3
pkgrel=1
pkgdesc='Discrete-time and continuous-time hidden Markov model library'
url='https://pypi.python.org/pypi/hmms'
depends=('python' 'cython' 'ipython' 'python-matplotlib' 'jupyter-notebook' 'python-numpy' 'python-pandas' 'python-scipy')
makedepends=(python-build python-installer python-wheel) #python-pytest-runner)
license=('Public Domain')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('16b622a5d14719c0e98b6cf1b01540cbcee967425a42d117bca6307fe5ba289f')

build() {
    cd ${srcdir}/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${_name}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
}

#check() {  # I don't know how to make this work since it depends on python-hmms being installed
#    cd "${srcdir}/${_name}-${pkgver}"
#    pytest test/
#}
