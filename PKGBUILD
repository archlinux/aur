# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Martchus <martchus@gmx.net>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jason Giangrande <jgiangrande@clarku.edu>

_pkgname=pyusb
pkgname=python2-pyusb
pkgdesc="USB access on Python"
pkgver=1.1.0
pkgrel=1
arch=('any')
url="https://github.com/pyusb/pyusb"
license=('custom')
depends=('python2' 'libusb')
makedepends=('python2-setuptools' 'python2-setuptools-scm')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/pyusb/pyusb/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz::https://github.com/pyusb/pyusb/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz.asc")
sha512sums=('0769670e6ebd8b31f2494258eca5d6e470ad3cb17663cc14b8b3a8136ea24caa23f86d81c60c501b88a9bc94b0de6a45aac43c6c5f140e65fd03a589b4d18179'
            '0769670e6ebd8b31f2494258eca5d6e470ad3cb17663cc14b8b3a8136ea24caa23f86d81c60c501b88a9bc94b0de6a45aac43c6c5f140e65fd03a589b4d18179')
validpgpkeys=('B04841AE800C1BF01FE1BC3D084C5584542E1574'  # Wander Lairson Costa <wcosta@mozilla.com>
              '23F335ED4E829797734B22F65841AF7406AF7AD0') # Jonas Tadeu Silva Malaco Filho <jonas@jonasmalaco.com>

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
