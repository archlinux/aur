# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgbase=paho-mqtt
pkgname="python2-${pkgbase}"
pkgver=1.4.0
pkgrel=1
pkgdesc="Python 2 client library for MQTT v3.1 and v3.1.1"
url="http://www.eclipse.org/paho/clients/python"
makedepends=('python2-setuptools')
license=('EPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgbase::1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('e440a052b46d222e184be3be38676378722072fcd4dfd2c8f509fb861a7b0b79')


build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
