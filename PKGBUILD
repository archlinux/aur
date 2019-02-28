# Maintainer: Robert Tari <robert at tari dot in>

pkgname=cajarename
_pkgnamealt=caja-rename
pkgver=18.7.28.25
_pkgverextra=ubuntu19.04.1
pkgrel=1
pkgdesc="Batch renaming extension for Caja"
arch=('any')
url="https://tari.in/www/software/cajarename"
license=('GPL3')
depends=('caja' 'python-caja' 'python2-gobject' 'gobject-introspection' 'gtk3')
makedepends=('python2-setuptools' 'python2-polib')
install=${pkgname}.install
source=("https://launchpad.net/~robert-tari/+archive/ubuntu/main/+sourcefiles/${pkgname}/${pkgver}~${_pkgverextra}/${pkgname}_${pkgver}~${_pkgverextra}.tar.xz")
sha256sums=('43795299b368220cb93f8b85b5db71e9697e019b8dc3d052e9414e9708e37323')
provides=("${_pkgnamealt}")
conflicts=("${_pkgnamealt}")

build()
{
    cd "${srcdir}/${pkgname}-${pkgver}~${_pkgverextra}"
    python2 setup.py build
}

package()
{
    cd "${srcdir}/${pkgname}-${pkgver}~${_pkgverextra}"
	python2 setup.py install --root="${pkgdir}" --optimize=1

}
