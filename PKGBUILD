pkgbase='python-scenedetect'
pkgname=('python-scenedetect')
_module='scenedetect'
pkgver='0.6.0.2'
pkgrel=1
pkgdesc="A cross-platform, OpenCV-based video scene detection program and Python library."
url="https://github.com/Breakthrough/PySceneDetect"
depends=('python' 'qt5-base' 'python-click' 'python-numpy' 'opencv')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('727a4ec42bb3747c500ec06f58397f01a9e62d63918549bd4e2251c801a668da')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -c "from setuptools import setup;setup()" build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -c "from setuptools import setup;setup()" install --root="${pkgdir}" --optimize=1 --skip-build
}
