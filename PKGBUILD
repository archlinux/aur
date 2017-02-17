pkgname=python-pomegranate
pkgver=0.6.1
pkgrel=1
pkgdesc="Pomegranate is a graphical models library for Python, implemented in Cython for speed."
arch=('i686' 'x86_64') # packages contains arch dependend libs
url="http://pypi.python.org/pypi/pomegranate/"
license=('MIT')
depends=('python' 'cython' 'python-networkx' 'python-joblib' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/e4/e1/376a1f6eaa41172f120663dccf4d974db2db5c79216340a1bd009c5e7285/pomegranate-${pkgver}.tar.gz"
        "LICENSE") # License copied from the GitHub repo <https://github.com/jmschrei/pomegranate>
sha256sums=('3a7f004daed0e00e4b4f75000311d55503a9cb4fb06bea2a8262ce1f68245ece'
            '8c335bd762f024a24b8faf505d269a12916c7ff607e8fec2c40470bdec4a58fa')

build() {
    cd ${pkgname/python-}-${pkgver}
    python setup.py build
}

package() {
    cd ${pkgname/python-}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
