# Maintainer: Élie Bouttier <elie+aur@bouttier.eu>

pkgname=python-rq-dashboard
pkgver=0.3.10
pkgrel=1
pkgdesc="Flask-based web front-end for monitoring RQ queues"
arch=('any')
license=('BSD')
url="https://github.com/eoranged/rq-dashboard/"
makedepends=('python' 'python-setuptools')
depends=('python' 'python-click' 'python-flask' 'python-redis'
         'python-rq' 'python-arrow')
source=("${url}archive/${pkgver}.tar.gz")
sha256sums=('ba0103b2fcfd1b09530e0fc1a11b66280ce2ea71f123357db0725687668dbe60')

package() {
    cd "${srcdir}/rq-dashboard-${pkgver}"

    python setup.py install --root="${pkgdir}" -O1
    mv "${pkgdir}/usr/bin/rq-dashboard"{,3}
    ln -s "/usr/bin/rq-dashboard3" "${pkgdir}/usr/bin/rq-dashboard"
    install -Dm644 "LICENSE" "${srcdir}/usr/share/licenses/${pkgname}/LICENSE"
}
