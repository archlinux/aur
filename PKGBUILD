pkgbase='python-hdl-checker'
pkgname=('python-hdl-checker')
_module='hdl-checker'
pkgver='0.7.4'
pkgrel=1
pkgdesc="HDL code checker"
url="https://github.com/suoto/hdl_checker"
depends=('python')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('8f197a39162857612a2848ff013ba9ea5a40122ad34119b1c032614167bc322f')

build() {
    cd "${srcdir}/${_module/-/_}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module/-/_}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
