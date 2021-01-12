# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='repotool'
pkgver=1.3.0
pkgrel=1
pkgdesc='An arch linux repository management tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'python-setuptools')
makedepends=('git' 'python-setuptools-scm')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}
