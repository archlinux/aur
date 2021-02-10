#Maintainer: Dakota marshalldakota549@pm.me

pkgname=('wifi-password')
_module='wifi-password'
pkgver='1.0.9'
pkgrel=1
pkgdesc="Quickly fetch your WiFi password and if needed, generate a QR code of your WiFi to allow phones to easily connect"
url="https://github.com/sdushantha/wifi-password"
depends=('python' 'python-qrcode' 'python-pillow' 'python-colorama' 'python-image')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('8b700c0d33796af88c2c8d35b1722c06fc816205b74e767f0e449dec52322607')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


