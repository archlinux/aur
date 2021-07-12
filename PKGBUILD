# Maintainer: Tibor Bamhor <tiborb95 at gmail dot com>
pkgbase=repokeeper
pkgname=repokeeper
pkgver=0.3.6
pkgrel=1
pkgdesc="Local AUR packages repository keeper and updater"
arch=('any')
url="https://github.com/tibor95/repokeeper"
license=('GPL3')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/tibor95/repokeeper.git#commit=4e23a9971f3933ceb5fc7b3dca2a8ddc788ecc8e")
md5sums=('SKIP')
backup=('etc/repokeeper.conf')

package() {
    cd ${srcdir}/${pkgname}
    python3 setup.py -q install --root="$pkgdir"
    install -D -m0666 ${srcdir}/${pkgname}/repokeeper.conf ${pkgdir}/etc/repokeeper.conf
}
