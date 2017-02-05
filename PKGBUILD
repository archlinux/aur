# Maintainer: Élie Bouttier <elie+aur@bouttier.eu>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgbase=python-rq
pkgname=('python-rq' 'python2-rq')
pkgver=0.7.1
pkgrel=1
pkgdesc="A simple, lightweight, library for creating background jobs, and processing them"
arch=('any')
license=('BSD')
url="https://github.com/nvie/rq/"
makedepends=('python' 'python-setuptools' 'python-click' 'python-redis'
             'python2' 'python2-setuptools' 'python2-click' 'python2-redis')
source=("https://github.com/nvie/rq/archive/${pkgver}.tar.gz")
sha256sums=('96640fd589efc18a264b18c5ea85fd1d22f26b22ab2d7744c59a60ff53c1e679')

package_python-rq() {
    depends=('python' 'python-click' 'python-redis')

    cd "${srcdir}/rq-${pkgver}"

    python setup.py install --root="${pkgdir}" -O1
    mv "${pkgdir}/usr/bin/rq"{,3}
    mv "${pkgdir}/usr/bin/rqinfo"{,3}
    mv "${pkgdir}/usr/bin/rqworker"{,3}
    ln -s "/usr/bin/rq3" "${pkgdir}/usr/bin/rq"
    ln -s "/usr/bin/rqinfo3" "${pkgdir}/usr/bin/rqinfo"
    ln -s "/usr/bin/rqworker3" "${pkgdir}/usr/bin/rqworker"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-rq() {
    depends=('python2' 'python2-click' 'python2-redis')

    cd "${srcdir}/rq-${pkgver}"

    python2 setup.py install --root="${pkgdir}" -O1
    mv "${pkgdir}/usr/bin/rq"{,2}
    mv "${pkgdir}/usr/bin/rqinfo"{,2}
    mv "${pkgdir}/usr/bin/rqworker"{,2}
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
