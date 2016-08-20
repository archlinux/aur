# Maintainer: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jason Giangrande <jgiangrande@clarku.edu>

_pkgname=pyusb
pkgname=python2-pyusb
pkgver=1.0.0
pkgrel=2
pkgdesc="A native Python module written in C which provides USB access."
arch=('i686' 'x86_64')
url="https://github.com/walac/pyusb"
license=('custom')
depends=('python2' 'libusb')
makedepends=('python2-distribute')
conflicts=($_pkgname=$pkgver)
provides=($_pkgname)
replaces=('python2-pyusb-beta')
source=("https://github.com/walac/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('af5549750140d12229202e8c32f48d6f2bbcda632b43763f7cefc51f63c61d5d9c4bf816842019729c911aedca792269a2cacad08d668d7ec569038b9979e3de')

build() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py install -f --root="${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
