# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>
# Prev. Maintainer: Prasad Kumar
# Author: Vitor Lopes <vmnlop@gmail.com>

pkgname=jade-application-kit
pkgver=3.5.5
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
sha512sums=('cad157b68c0f086b56fac25556c02b8974c5508e68d9226e35f8286c5720953d3882483aed45c9021780acba5e0c889071eeef760ed78f26a550b3ba0f21a4a7')

prepare() {
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
	#patch --strip=1  < ../import_fix.patch
}

build() {
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
