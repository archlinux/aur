# Maintainer: Tomatopaste <marc.mail@gmx.net>
pkgname=('python-jupyter-book')
_pkgname=('jupyter-book')
pkgver='0.6.4'
pkgrel=1
pkgdesc="Create books with Jupyter Notebooks and Jekyll."
url="https://github.com/jupyter/jupyter-book/"
depends=('python'
  'python-pytest'
  'python-ruamel-yaml'
  'python-pyaml'
  'python-libsass'
  'python-tqdm'
  'python-setuptools'
  'python-jupytext'
  'jupyter-nbformat'
  'jupyter-nbconvert'
  'python-jupyter_client'
  'python-ipykernel')
checkdepends=()
makedepends=()
license=('BSD')
arch=("any")  
source=("https://github.com/jupyter/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('22e8f232f61ebbd6684659ac28e053cd6836e8e57179891a7c038ed26abcd715')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
