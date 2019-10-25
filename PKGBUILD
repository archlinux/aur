# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgbase='python-bitmath'
pkgname=('python-bitmath')
_module='bitmath'
pkgver='1.3.3.1'
pkgrel=1
pkgdesc="Python module for representing and manipulating file sizes with different prefix notations (file size unit conversion)"
url="https://github.com/tbielawa/bitmath"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('293325f01e65defe966853111df11d39215eb705a967cb115851da8c4cfa3eb8')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
