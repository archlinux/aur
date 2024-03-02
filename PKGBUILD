# Maintainer: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: NIgel Kukard <nkukard at LBSD dot net>
# Contributor: RcrdBrt

pkgname=python-flask-admin
_module='Flask-Admin'
pkgver='1.6.1'
pkgrel=1
pkgdesc="Simple and extensible admin interface framework for Flask"
url="https://github.com/flask-admin/flask-admin/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('24cae2af832b6a611a01d7dc35f42d266c1d6c75a426b869d8cb241b78233369')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
