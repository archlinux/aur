pkgbase='python-scenedetect'
pkgname=('python-scenedetect')
_module='scenedetect'
pkgver='0.5.6'
pkgrel=1
pkgdesc="A cross-platform, OpenCV-based video scene detection program and Python library."
url="https://github.com/Breakthrough/PySceneDetect"
depends=('python' 'qt5-base' 'python-click' 'python-numpy' 'opencv')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b70fe1e86b8c67130c4cb0af767a3ebfa7fbb261289ea9d0f8ed22d668ebed33')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
