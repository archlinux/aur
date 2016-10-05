# Maintainer: Élie Bouttier <elie+aur@bouttier.eu>

pkgname=python2-rq-dashboard
pkgver=0.3.7
pkgrel=1
pkgdesc="Flask-based web front-end for monitoring RQ queues"
arch=('any')
license=('BSD')
url="https://github.com/ducu/rq-dashboard/"
makedepends=('python2' 'python2-setuptools')
depends=('python2' 'python2-click' 'python2-flask' 'python2-redis'
         'python2-rq' 'python2-arrow')
source=("${url}archive/${pkgver}.tar.gz")
sha256sums=('3aa541bf643af5d89bf9fc52e27ed05a3daeea188bda599cf65446f158d00e84')

package() {
    cd "${srcdir}/rq-dashboard-${pkgver}"

    python2 setup.py install --root="${pkgdir}" -O1
    install -Dm644 "LICENSE" "${srcdir}/usr/share/licenses/${pkgname}/LICENSE"
}
