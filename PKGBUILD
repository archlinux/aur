# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>
# Prev. Maintainer: Prasad Kumar
# Author: Vitor Lopes <vmnlop@gmail.com>

pkgname=jade-application-kit
pkgver=3.5.5
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
sha512sums=('710957cde8e3fe3825e7e5ed0aa57f6487a25f572c3c559fe799217b6befce4d9a109edd2f58715e50e29b88e3da05906cd1728b69a1b45e642d3e1aba344587')

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
