pkgbase='python-waller'
pkgname=('python-waller')
_module='waller'
pkgver=0.3.5
pkgrel=1
pkgdesc="Python curses utility to cycle between desktop wallpapers"
url="https://github.com/codeswhite/$_module"
depends=('python' 'xorg-xrandr')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("5ee8ac7466db1eb03ad49444048988fe522c80063851c4f3ece52d346ccbb2e5")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
