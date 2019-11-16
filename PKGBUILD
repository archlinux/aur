# Maintainer: Yigit Dallilar <yigit.dallilar@gmail.com>
# Prev. Maintainer: Prasad Kumar
# Author: Vitor Lopes <vmnlop@gmail.com>
pkgname=jade-application-kit
pkgver=2.0.10
pkgrel=3
pkgdesc="Build desktop applications using web technologies on Linux, with Python, JavaScript, HTML5, and CSS3 and webkit."
arch=('any')
url="https://pypi.org/project/Jade-Application-Kit/"
license=('GPL3')
provides=('jade-application-kit')
conflicts=('jade-application-kit-git')
depends=('python' 'python-gobject' 'webkit2gtk' 'pyside2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/13/54/853ffbc55665becd492f4ea7d72d6333b33a561ccfdf105a2435edefb260/Jade-Application-Kit-${pkgver}.tar.gz")
sha512sums=('3252de12d3c89d47e9e096e11a806d778da15003b2df96ae31f5832f55e88abc962719eb169361bdbb3a683b844d944acab2942808ffb593aa3bcd1060913249')

build() {
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}"/Jade-Application-Kit-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
