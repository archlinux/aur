pkgbase='python-waller'
pkgname=('python-waller')
_module='waller'
pkgver=0.3.6
pkgrel=1
pkgdesc="Python curses utility to cycle between desktop wallpapers"
url="https://github.com/codeswhite/$_module"
depends=('python' 'xorg-xrandr')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("d7d46ab3be33d3d6bbd03d4e6d556d0657f2c7c909643f71adf4872632117a9f")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
