# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>
# Prev. Maintainer: Prasad Kumar
# Author: Vitor Lopes <vmnlop@gmail.com>
pkgname=jade-application-kit
pkgver=2.1.4
pkgrel=1
pkgdesc="Build desktop applications using web technologies on Linux, with Python, JavaScript, HTML5, and CSS3 and webkit."
arch=('any')
url="https://github.com/codesardine/Jade-Application-Kit"
license=('GPL3')
optdepends=('python-pyqtwebengine: PyQt5 support')
provides=('jade-application-kit')
conflicts=('jade-application-kit-git')
depends=('python' 'python-gobject' 'webkit2gtk' 'pyside2')
makedepends=('python-setuptools')
source=("https://github.com/codesardine/Jade-Application-Kit/archive/v${pkgver}.tar.gz")
sha512sums=('a5e13469ca1567d5f9b3189a7372b4c6ba8b80404ec0e146e610c3c3ad2d1d139aa9c8fb11452b9224df71ad180511c87cf228ca46c012857ea17f6d0951cfcb')

build() {
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
