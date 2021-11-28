# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: pypi
# what: PyGLM

pkgbase='python-pyglm'
pkgname=('python-pyglm')
_module='PyGLM'
pkgver='2.5.7'
pkgrel=1
pkgdesc="OpenGL Mathematics library for Python"
url="https://github.com/Zuzu-Typ/PyGLM"
depends=('python')
makedepends=('python-setuptools')
license=('ZLIB')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('38fdff84e6416decffe1c5874632807d58b98c5508cca3579bb2f5332e099fd8')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
