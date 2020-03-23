# Maintainer: Alexandr Parkhomenko

_module=multitasking
pkgname=python-multitasking-git
pkgver=1
pkgrel=1
pkgdesc="Non-blocking Python methods using decorators"
url="https://github.com/ranaroussi/multitasking"
depends=('python-requests')
makedepends=('python-setuptools')
license=('apache2')
arch=('any')
source=("git://github.com/ranaroussi/multitasking")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_module}"
    git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
    cd "${srcdir}/${_module}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

