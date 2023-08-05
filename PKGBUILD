# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=python-cronsim
_pkgname=${pkgname#python-}
_pkgver=2.5
pkgver=2.5.0
pkgrel=3
pkgdesc="A python cron expression parser and evaluator."
arch=('any')
url="https://github.com/cuu508/cronsim"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$_pkgver.tar.gz")
sha256sums=('153cf0219dcc1a0ca9e71a836afdb60796537d8c521c686c7a731348375733bf')

build() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
