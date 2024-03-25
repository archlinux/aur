pkgname=('python-argcomplete-git')
_module='argcomplete'
pkgver='3.2.3'
pkgrel=1
pkgdesc="Bash tab completion for argparse"
url="https://github.com/kislyuk/argcomplete"
provides=(python-argcomplete)
conflicts=(python-argcomplete)
replaces=(python-argcomplete)
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('bf7900329262e481be5a15f56f19736b376df6f82ed27576fa893652c5de6c23')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
