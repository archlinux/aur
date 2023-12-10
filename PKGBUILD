# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgname=python-django-stubs-ext
_pkgname=django-stubs
pkgver=4.2.7
pkgrel=1
pkgdesc="Extensions and monkey-patching for django-stubs."
arch=('any')
url="https://github.com/typeddjango/django-stubs"
license=('MIT')
depends=(python-django)
makedepends=(python-build
	     python-installer
	     python-setuptools
	     python-wheel)
source=($url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('78c2750b95a877260b44354d43ff6eee8b516cdb909398df7e78da060cc42a78')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/ext"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/ext"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
