# Maintainer: Jason van Gumster <fweeb@monsterjavaguns.com>

pkgname=python-rq-scheduler
pkgver=0.8.3
pkgrel=1
pkgdesc="Small package that adds job scheduling capabilities to RQ."
arch=('any')
license=('MIT')
url="https://github.com/rq/rq-scheduler/"
makedepends=('python' 'python-setuptools')
depends=('python-rq')
source=("${url}archive/v${pkgver}.tar.gz")
sha256sums=('a5551ac6bcc97eb791c0375b55f6cab975882e42dd4d5c1f361f77202fe9b5bb')

package() {
    cd "${srcdir}/rq-scheduler-${pkgver}"

    python setup.py install --root="${pkgdir}" -O1
    mv "${pkgdir}/usr/bin/rqscheduler"{,2}
    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
