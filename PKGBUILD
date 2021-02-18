#Maintainer: Dakota marshalldakota549@pm.me

pkgname=('wifi-password')
_module='wifi-password'
pkgver='1.1.1'
pkgrel=1
pkgdesc="Quickly fetch your WiFi password and if needed, generate a QR code of your WiFi to allow phones to easily connect"
url="https://github.com/sdushantha/wifi-password"
depends=('python' 'python-qrcode' 'python-pillow' 'python-colorama' 'python-image')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('4ef68bf5566db5bbe7cf7d1e513fee7543f90371475f6ec9b9e488b4d3601078')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


