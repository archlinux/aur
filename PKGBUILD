# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=('python-guizero')
_module='guizero'
pkgver='0.5.3'
pkgrel=1
pkgdesc="Python module to allow learners to easily create GUIs"
url="https://github.com/lawsie/guizero"
depends=('python-pillow')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/g/guizero/guizero-${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/lawsie/guizero/master/license.txt')
md5sums=('4d6f6274a5bec5f82e45ae5f814c1f4a'
         '9670acd16790b84f21178f2b940a96e2')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 "$srcdir/license.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
