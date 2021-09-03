# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# pkg: pypi PyGLM

pkgbase='python-pyglm'
pkgname=('python-pyglm')
_module='PyGLM'
pkgver='2.3.1'
pkgrel=1
pkgdesc="OpenGL Mathematics library for Python"
url="https://github.com/Zuzu-Typ/PyGLM"
depends=('python')
makedepends=('python-setuptools')
license=('ZLIB')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f12097dfcb709b22e31122a0e579a6ebc50f0822569ee05ac55f5347a36ee13f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
