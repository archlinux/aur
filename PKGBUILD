# Maintainer: Ben Oliver <ben@bfoliver.com>

pkgbase='python-ansiwrap'
pkgname=('python-ansiwrap')
_module='ansiwrap'
pkgver='0.8.4'
pkgrel=1
pkgdesc="textwrap, but savvy to ANSI colors and styles"
url="https://github.com/jonathaneunice/ansiwrap"
depends=('python' 'python-textwrap3')
makedepends=('python-setuptools')
license=('Python')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.zip")
md5sums=('0e24741bda593b7bd2162c3e3bd3b8ba')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
