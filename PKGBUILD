pkgbase='python2-argon2'
pkgname=('python2-argon2')
_module='argon2'
pkgver='0.1.10'
pkgrel=1
pkgdesc="Bindings for the argon2 password hasher"
url="https://github.com/flamewow/argon2_py"
depends=('python2')
makedepends=('python2-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('523a3d3b88f3a46244b4976a6ca81994705848538bbe9e41426ea54ccb75eb90')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
