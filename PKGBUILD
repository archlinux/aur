pkgbase='python-scenedetect'
pkgname=('python-scenedetect')
_module='scenedetect'
pkgver='0.6.5'
pkgrel=1
pkgdesc="A cross-platform, OpenCV-based video scene detection program and Python library."
url="https://github.com/Breakthrough/PySceneDetect"
depends=('python' 'qt5-base' 'python-click' 'python-numpy' 'opencv' 'python-opencv')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('4ec8504696e462cfe10aeeeeaa994996c56ae0afb5e3c90f644594c41de994b2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -c "from setuptools import setup;setup()" build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -c "from setuptools import setup;setup()" install --root="${pkgdir}" --optimize=1 --skip-build
}
