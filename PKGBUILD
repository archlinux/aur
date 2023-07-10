# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-core
_pyname=glue-core
pkgver=1.12.0
pkgrel=1
pkgdesc="Linked Data Visualizations Across Multiple Files -- core library"
arch=('any')
url="http://glueviz.org"
license=('BSD')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-scipy' 'python-pandas' 'python-echo'
         'python-astropy' 'python-setuptools' 'python-qtpy' 'ipython' 'python-ipykernel' 'python-qtconsole'
         'python-dill' 'python-xlrd' 'python-h5py' 'python-openpyxl' 'python-pvextractor'
         'python-mpl-scatter-density' 'python-pyqt5' 'hicolor-icon-theme')
optdepends=('python-astrodendro: for dendrograms'
            'python-pyavm: for reading AVM metadata'
            'python-spectral-cube: for reading spectral cubes'
            'python-scikit-image: highly recommended and domain-independent'
            'pyside2: alternative qt support')
makedepends=('python-setuptools-scm' 'desktop-file-utils')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('f0a40f7d80a971b42fa7051d9e4c43a3accdd3e328aadc093bb45b038fbcc068')

package() {
    cd "${srcdir}/${_pyname}-${pkgver}"

    python setup.py install -O1 --root="${pkgdir}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm 644 glueviz.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "glueviz.desktop"
}

