pkgbase='python-waller'
pkgname=('python-waller')
_module='waller'
pkgver='0.3.4'
pkgrel=1
pkgdesc="Python curses utility to cycle between desktop wallpapers"
url="https://github.com/codeswhite/$_module"
depends=('python' 'xorg-xrandr')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d54256b8ca5d1df2241b681c9ce0a1cbf09113fb6cc8b49e26618e021fd8cf7c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
