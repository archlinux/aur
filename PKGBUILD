pkgbase='python-scenedetect'
pkgname=('python-scenedetect')
_module='scenedetect'
pkgver='0.6.1'
pkgrel=1
pkgdesc="A cross-platform, OpenCV-based video scene detection program and Python library."
url="https://github.com/Breakthrough/PySceneDetect"
depends=('python' 'qt5-base' 'python-click' 'python-numpy' 'opencv')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('9b5f0f21e2dc4aad6e1df6db431b66fc764d2e5e8a3bfb4085d4ec5a692cd1ac')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -c "from setuptools import setup;setup()" build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -c "from setuptools import setup;setup()" install --root="${pkgdir}" --optimize=1 --skip-build
}
