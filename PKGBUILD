# Maintainer: ZWindL <zwindl@protonmail.com>
pkgbase=python-flask12
pkgname=python-flask12
_module='Flask'
pkgver=0.12.4
pkgrel=2
pkgdesc=" The Python micro framework for building web applications"
url="https://github.com/pallets/flask"
depends=('python' 'python-werkzeug' 'python-jinja' 'python-itsdangerous' 'python-click')
makedepends=('python-setuptools')
provides=('python-flask')
conflicts=('python-flask')
license=('MIT')
arch=('any')
source=("https://github.com/pallets/flask/releases/download/0.12.4/Flask-0.12.4.tar.gz")
md5sums=('f885afe6dd25e8d48d5ba23f2857687e')
build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
