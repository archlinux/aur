# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>
# Prev. Maintainer: Prasad Kumar
# Author: Vitor Lopes <vmnlop@gmail.com>
pkgname=jade-application-kit
pkgver=2.1.1
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
source=("https://github.com/codesardine/Jade-Application-Kit/archive/v2.1.1.tar.gz")
sha512sums=('bb7ec4a8a2c38a5c74cd195a95aa1026a12e73ad883497381a84625f2e3c91f0b36d828aff64906cb9f0584e1cf2106aa48d89909b57ea15d5e9be028b3b1672')

build() {
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
