pkgbase='python-probat'
pkgname=('python-probat')
_module='probat'
pkgver=1.1.0
pkgrel=1
pkgdesc="Battery life saver and reminder"
url="https://github.com/codeswhite/probat"
depends=('python' 'python-termcolor')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("0f7a7e415f2fb90dadf7acaa787aa7944715f68877e2164fda95a0186e50ee5e")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
