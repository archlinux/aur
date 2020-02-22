pkgbase='python-scenedetect'
pkgname=('python-scenedetect')
_module='scenedetect'
pkgver='0.5.1.1'
pkgrel=2
pkgdesc="A cross-platform, OpenCV-based video scene detection program and Python library."
url="https://github.com/Breakthrough/PySceneDetect"
depends=('python' 'qt5-base' 'python-click')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('16526b5c1c1eca0fd060571b62f979a3a2b9a0c47a76edffcde56099cf1efe24')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
