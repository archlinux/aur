# Mantainer: Jose Riha <jose1711 gmail com>

pkgname=python-cheap_repr
_module='cheap_repr'
pkgver=0.5.1
pkgrel=1
pkgdesc="Better version of repr/reprlib for short, cheap string representations."
url="http://github.com/alexmojaki/cheap_repr"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        "LICENSE")
sha256sums=('31ec63b9d8394aa23d746c8376c8307f75f9fca0b983566b8bcf13cc661fe6dd'
            'a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
