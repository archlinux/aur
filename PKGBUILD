# Maintainer: Ben Oliver <ben@bfoliver.com>

pkgbase='python-flask-reverse-proxy-fix'
pkgname=('python-flask-reverse-proxy-fix')
_module='flask-reverse-proxy-fix'
pkgver='0.2.1'
pkgrel=2
pkgdesc="Python Flask middleware for applications running under a reverse proxy."
url="https://github.com/antarctica/flask-reverse-proxy-fix"
depends=('python' 'python-flask' 'bandit' 'flake8' 'twine' 'python-wheel')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('03ce3312d92f2b0073205e74bee1e6213640b44b1de730375d8cf478447e208c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
