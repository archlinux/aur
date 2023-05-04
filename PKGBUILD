# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='repotool'
pkgver=1.5.3
pkgrel=3
pkgdesc='An arch linux repository management tool'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd ${srcdir}/${pkgname}
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/${pkgname}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
