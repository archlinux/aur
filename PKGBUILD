# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>
# Prev. Maintainer: Prasad Kumar
# Author: Vitor Lopes <vmnlop@gmail.com>

pkgname=jade-application-kit
pkgver=3.5.4
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
source=("https://github.com/codesardine/Jade-Application-Kit/archive/v${pkgver}.tar.gz"
		"import_fix.patch")
sha512sums=('cad157b68c0f086b56fac25556c02b8974c5508e68d9226e35f8286c5720953d3882483aed45c9021780acba5e0c889071eeef760ed78f26a550b3ba0f21a4a7'
            '6e9109258ea77a272b87dabb857cd1c21439b312778fc7056ae4fcc804f666af1128c9050b958deaea5e2450e4dced011b6553749f0b6db17c1d454d171caecf')

prepare() {
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
	patch --strip=1  < ../import_fix.patch
}

build() {
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
