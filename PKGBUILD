# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: pypi
# what: PyGLM

pkgbase='python-pyglm'
pkgname=('python-pyglm')
_module='PyGLM'
pkgver='2.5.6'
pkgrel=1
pkgdesc="OpenGL Mathematics library for Python"
url="https://github.com/Zuzu-Typ/PyGLM"
depends=('python')
makedepends=('python-setuptools')
license=('ZLIB')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d161793677b5d0547a188c0d58cc072c4eeb84cd29f8f8216b0c94b88e1a600e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
