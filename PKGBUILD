# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>
# Prev. Maintainer: Prasad Kumar
# Author: Vitor Lopes <vmnlop@gmail.com>

pkgname=jade-application-kit
pkgver=3.5.7
pkgrel=2
pkgdesc="Build desktop applications using web technologies on Linux, with Python, JavaScript, HTML5, and CSS3 and webkit."
arch=('any')
url="https://github.com/codesardine/Jade-Application-Kit"
license=('GPL3')
optdepends=()
provides=('jade-application-kit')
conflicts=('jade-application-kit-git')
depends=('python' 'python-gobject' 'webkit2gtk' 'pyside2' 'python-pyqtwebengine')
makedepends=('python-setuptools')
source=("https://github.com/codesardine/Jade-Application-Kit/archive/v${pkgver}.tar.gz")
sha512sums=('6650b01a9a60f53040f287a4b7cd2a40e0d371efab7f77823ca378e6c5ebcbdd270341f1a16ce6641e6a9cfc6eb6a3566fc059127703b732fcba436794e50eb6')

prepare() {
    cd "${srcdir}"/jak-${pkgver}
}

build() {
    cd "${srcdir}"/jak-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}"/jak-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
