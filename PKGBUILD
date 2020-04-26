# Maintainer: Élie Bouttier <elie+aur@bouttier.eu>

pkgname=python-rq-dashboard
pkgver=0.6.1
pkgrel=1
pkgdesc="Flask-based web front-end for monitoring RQ queues"
arch=('any')
license=('BSD')
url="https://github.com/Parallels/rq-dashboard/"
makedepends=('python' 'python-setuptools')
depends=('python' 'python-click' 'python-flask' 'python-redis'
         'python-rq' 'python-arrow')
source=("${url}archive/${pkgver}.tar.gz")
sha256sums=('624be5c9823dcf719430f4b7064dec77c5b7b6cfd7143e6c499e2d03ee5538da')

package() {
    cd "${srcdir}/rq-dashboard-${pkgver}"

    python setup.py install --root="${pkgdir}" -O1
    mv "${pkgdir}/usr/bin/rq-dashboard"{,3}
    ln -s "/usr/bin/rq-dashboard3" "${pkgdir}/usr/bin/rq-dashboard"
    install -Dm644 "LICENSE" "${srcdir}/usr/share/licenses/${pkgname}/LICENSE"
}
