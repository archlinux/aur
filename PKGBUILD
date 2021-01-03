# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-birdseye
_module=birdseye
pkgver=0.8.4
pkgrel=2
pkgdesc="Graphical Python debugger which lets you view the values of all evaluated expressions"
url="http://github.com/alexmojaki/birdseye"
depends=(python-littleutils python-flask-humanize python-humanize python-flask-humanize python-cheap_repr python-outdated python-sqlalchemy python-cached-property python-future python-asttokens)
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
        "LICENSE")
sha256sums=('34fbf3a042f257e981cb0d4849d279457269d212851404b19bf9635af71e0701'
            'dfe14f8798c400cbcc85bb4536a686c6fcf3086b3446c3f7c7054a2bcd73ca6a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
