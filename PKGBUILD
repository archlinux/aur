# Maintainer: coldbug <coldBug@e.mail.de>
_pkgbase=TexSoup
pkgname=python-texsoup-git
pkgver=0.3.1.r8.gc91a14a
pkgrel=1
pkgdesc="TexSoup is a fault-tolerant, Python3 package for searching, navigating, and modifying LaTeX documents."
arch=('any')
conflicts=('python-texsoup')
url="https://github.com/alvinwan/TexSoup"
license=("BSD 2-clause")
provides=('python-texsoup')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/alvinwan/TexSoup.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbase}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgbase}"
    python setup.py build
}

package() {
	cd "${srcdir}/${_pkgbase}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
