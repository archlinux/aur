#Maintainer: Dakota marshalldakota549@pm.me

pkgname=('wifi-password')
_module='wifi-password'
pkgver='1.0.3'
pkgrel=1
pkgdesc="Quickly fetch your WiFi password and if needed, generate a QR code of your WiFi to allow phones to easily connect"
url="https://github.com/sdushantha/wifi-password"
depends=('python' 'wireless_tools' 'python-qrcode')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('55aba4acb84cf35231e629b8440fd9e17bf3ceefd0cba64c8580855070ed8456')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


