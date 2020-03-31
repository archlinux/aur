# Maintainer: Ben Oliver <ben@bfoliver.com>

pkgbase='python-textwrap3'
pkgname=('python-textwrap3')
_module='textwrap3'
pkgver='0.9.2'
pkgrel=1
pkgdesc="textwrap from Python 3.6 backport (plus a few tweaks)"
url="https://github.com/jonathaneunice/textwrap3"
depends=('python')
makedepends=('python-setuptools')
license=('Python')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.zip")
md5sums=('fb3ce1d1b93adecd367a0f6c39f98306')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
