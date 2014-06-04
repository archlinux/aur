# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Andrew Conkling <andrewski@fr.st>
pkgname=python-empy
realname=empy
pkgver=3.3.2
pkgrel=3
pkgdesc="A powerful and robust templating system for Python."
arch=(i686 x86_64)
url="http://www.alcyone.com/software/empy"
depends=('python>=3')
license=('LGPL')
source=("http://www.alcyone.com/software/empy/empy-$pkgver.tar.gz")
md5sums=('fbb34761cdf9acc4c65e298c9eced395')

build() {
    cd ${srcdir}/empy-$pkgver
    python3 setup.py build
}

package() {
    cd ${srcdir}/empy-$pkgver
    python3 setup.py install -O2 --skip-build --prefix=/usr --root=${pkgdir}
}
