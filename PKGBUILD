# Maintainer: Frank Motsch <frank@motschsoft.de>
pkgname=python-posix_ipc
pkgver=1.1.1
pkgrel=1
pkgdesc="POSIX IPC primitives (semaphores, shared memory and message queues) for Python"
arch=(x86_64 i686 aarch64)
url="https://github.com/osvenskan/posix_ipc"
license=('BSD')
groups=()
depends=('python')
makedepends=('python-distribute')
options=(!emptydirs)
source=("python-posix_ipc-rel${pkgver}.tar.gz::https://github.com/osvenskan/posix_ipc/archive/refs/tags/rel${pkgver}.tar.gz")
sha1sums=('8af031b944a05f0928bf5c3405fd514c76066dba')

build() {
    cd "${srcdir}/posix_ipc-rel${pkgver}"

    python setup.py build

}

package() {
    cd "${srcdir}/posix_ipc-rel${pkgver}"

    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
