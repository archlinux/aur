# Maintainer: Popolon <popolon@popolon.org>
# Made with pip2pkgbuild

pkgbase='python-harview'
pkgname=('python-harview')
_module='harview'
pkgver='0.2.2'
pkgrel=1
pkgdesc="A commandline tool which takes as input a .har (HTTP Archive) file and dumps a human-readable summary of it to the console"
url="https://github.com/fboender/harview"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('70d8022ef8845860a5423e3755f64439add0ef3f02ae5ec5ec15c6e31205d2be')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
