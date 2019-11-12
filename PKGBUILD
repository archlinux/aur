# Maintainer: Philippe Hürlimann <p@hurlimann.org>

pkgname=python-virtualbox
_pkgname=virtualbox-python
pkgver=2.0.0
pkgrel=1
pkgdesc="Complete implementation of VirtualBox's COM API with a Pythonic interface"
arch=('any')
url="https://github.com/sethmlarson/virtualbox-python"
license=('Apache')
depends=('virtualbox-sdk')
source=(${pkgname}-${pkgver}::https://github.com/sethmlarson/virtualbox-python/archive/v${pkgver}.tar.gz)
sha384sums=('e71c1404de70890fdf8f1f3f072d37a88c5c1ed2f56c10081cfb80f9b6e8b49036a4c4a68ac3635bb3683afc5e19145a')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}
