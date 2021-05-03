# Maintainer: Frank Motsch <frank@motschsoft.de>
pkgname=python-posix_ipc
pkgver=1.0.5
pkgrel=1
pkgdesc="POSIX IPC primitives (semaphores, shared memory and message queues) for Python"
arch=(x86_64 i686 aarch64)
url="http://semanchuk.com/philip/posix_ipc/"
license=('BSD')
groups=()
depends=('python')
makedepends=('python-distribute')
options=(!emptydirs)
source=("http://semanchuk.com/philip/posix_ipc/posix_ipc-$pkgver.tar.gz")
sha1sums=('08b095e560b7514b9e2b7de2d791c4f9d578cda9')

build() {
    cd "$srcdir/posix_ipc-$pkgver"

    python setup.py build

}

package() {
    cd "$srcdir/posix_ipc-$pkgver"

    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
