# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgbase=paho-mqtt
pkgname="python2-${pkgbase}"
pkgver=1.5.0
pkgrel=1
pkgdesc="Python 2 client library for MQTT v3.1 and v3.1.1"
url="http://www.eclipse.org/paho/clients/python"
makedepends=('python2-setuptools')
license=('EPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgbase::1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('e3d286198baaea195c8b3bc221941d25a3ab0e1507fc1779bdb7473806394be4')


build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
