# Maintainer: samuellittley <samuel.littley@toastwaffle.com>
# Contributer: warddr <aur@warddr.eu>
# Submitter: Gabriel Morrison <gdantas2 at gmail dot com>

pkgname=python2-flask-sqlalchemy
pkgver=2.0
pkgrel=1
pkgdesc="Adds SQLAlchemy support to your Flask application."
arch=(any)
url="http://pypi.python.org/pypi/Flask-SQLAlchemy"
license=("BSD")
depends=("python2" "python2-flask" "python2-sqlalchemy")
makedepends=("setuptools")
source=("http://pypi.python.org/packages/source/F/Flask-SQLAlchemy/Flask-SQLAlchemy-${pkgver}.tar.gz")
md5sums=('06ae73194cca73b72e178f870d1dac7c')

check() {
    cd "$srcdir/Flask-SQLAlchemy-$pkgver"
    python2 setup.py test
}

package() {
    cd "$srcdir/Flask-SQLAlchemy-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
