# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>
# Prev. Maintainer: Prasad Kumar
# Author: Vitor Lopes <vmnlop@gmail.com>

pkgname=jade-application-kit
pkgver=3.5.6
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
sha512sums=('5d1e65763371fe61e56eded78092f94737381a4707edac8b87003264c236b88ebc1db159c00e639ef8686e15489977b1fd3dfdbd00c53934aa1b4a38f9ad9454')

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
