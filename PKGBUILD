# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: pypi
# what: PyGLM

pkgbase='python-pyglm'
pkgname=('python-pyglm')
_module='PyGLM'
pkgver='2.5.3'
pkgrel=1
pkgdesc="OpenGL Mathematics library for Python"
url="https://github.com/Zuzu-Typ/PyGLM"
depends=('python')
makedepends=('python-setuptools')
license=('ZLIB')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('1b9a2e7c9b5835caa737c4c845426340d2b32a217593806e18c09dbdbe9b509e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
