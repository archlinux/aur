# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='mollyguardctl'
pkgver=1.3.6
pkgrel=1
pkgdesc='Guards your system from accidental reboots and shutdowns'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'python-setuptools')
makedepends=('git' 'python-setuptools-scm')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "${pkgname}"
    python setup.py build
}

package() {
    cd "${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
