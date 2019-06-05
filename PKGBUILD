# Maintainer: Élie Bouttier <elie+aur@bouttier.eu>

pkgname=python2-rq-dashboard
pkgver=0.5.1
pkgrel=1
pkgdesc="Flask-based web front-end for monitoring RQ queues"
arch=('any')
license=('BSD')
url="https://github.com/eoranged/rq-dashboard/"
makedepends=('python2' 'python2-setuptools')
depends=('python2' 'python2-click' 'python2-flask' 'python2-redis'
         'python2-rq' 'python2-arrow')
source=("${url}archive/${pkgver}.tar.gz")
sha256sums=('0f8ed5816146137b950a59bb5ac134ec42c173410eb812c95ecdf9f00ce3afd4')

package() {
    cd "${srcdir}/rq-dashboard-${pkgver}"

    python2 setup.py install --root="${pkgdir}" -O1
    mv "${pkgdir}/usr/bin/rq-dashboard"{,2}
    install -Dm644 "LICENSE" "${srcdir}/usr/share/licenses/${pkgname}/LICENSE"
}
