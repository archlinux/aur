# Maintainer: Élie Bouttier <elie+aur@bouttier.eu>

pkgname=python2-rq-dashboard
pkgver=0.3.8
pkgrel=1
pkgdesc="Flask-based web front-end for monitoring RQ queues"
arch=('any')
license=('BSD')
url="https://github.com/ducu/rq-dashboard/"
makedepends=('python2' 'python2-setuptools')
depends=('python2' 'python2-click' 'python2-flask' 'python2-redis'
         'python2-rq' 'python2-arrow')
source=("${url}archive/${pkgver}.tar.gz")
sha256sums=('a32b81009f0a4986f67272df74b9d808df2faa028f223eff3f5a3850c6006a2d')

package() {
    cd "${srcdir}/rq-dashboard-${pkgver}"

    python2 setup.py install --root="${pkgdir}" -O1
    install -Dm644 "LICENSE" "${srcdir}/usr/share/licenses/${pkgname}/LICENSE"
}
