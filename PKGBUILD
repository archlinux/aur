# Maintainer: Kevin Azzam <aur@azz.am>

pkgname='python-asyncio-glib'
_module='asyncio-glib'
pkgver='0.1'
pkgrel=2
pkgdesc="GLib event loop integration for asyncio."
url="https://github.com/jhenstridge/asyncio-glib"
makedepends=('python-setuptools')
license=('LGPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/asyncio-glib/asyncio-glib-${pkgver}.tar.gz")
sha256sums=('fe3ceb2ba5f541330c07ca1bd7ae792468d625bad1acf5354a3a7a0b9fd87521')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends=('gobject-introspection')

    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1

    install -Dm 644 COPYING.LGPL "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LGPL"
}
