# Maintainer: Élie Bouttier <elie+aur@bouttier.eu>

pkgname='python-rq-dashboard'
pkgver=0.6.5
pkgrel=1
pkgdesc="Flask-based web front-end for monitoring RQ queues"
arch=('any')
license=('BSD')
url="https://github.com/Parallels/rq-dashboard/"
makedepends=('python' 'python-setuptools')
depends=('python' 'python-click' 'python-flask' 'python-redis'
         'python-rq' 'python-arrow')
source=("${url}archive/v${pkgver}.tar.gz")
sha256sums=('de9bf74f37ce7c022909b73eea8f8e8e74a7eb9edc77bee1ea9887fa202d1745')

package() {
    cd "${srcdir}/rq-dashboard-${pkgver}"

    python setup.py install --root="${pkgdir}" -O1
    mv "${pkgdir}/usr/bin/rq-dashboard"{,3}
    ln -s "/usr/bin/rq-dashboard3" "${pkgdir}/usr/bin/rq-dashboard"
    install -Dm644 "LICENSE" "${srcdir}/usr/share/licenses/${pkgname}/LICENSE"
}
