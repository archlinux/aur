# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=python-cronsim
_pkgname=${pkgname#python-}
_pkgver=2.7
pkgver=2.7.0
pkgrel=2
pkgdesc="A python cron expression parser and evaluator."
arch=('any')
url="https://github.com/cuu508/cronsim"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=($url/archive/refs/tags/$_pkgver.tar.gz)
sha256sums=('9ae51c8567bfd9375b313d08c9307f7417ab7e7ff935914546a189f4c416c683')

build() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
