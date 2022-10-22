# Maintainer: Tibor Bamhor <tiborb95 at gmail dot com>
pkgbase=repokeeper
pkgname=repokeeper
pkgver=0.3.7
pkgrel=1
pkgdesc="Local AUR packages repository keeper and updater"
arch=('any')
url="https://github.com/tibor95/repokeeper"
license=('GPL3')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/tibor95/repokeeper.git#commit=a07a67ddb4a782e0319dbcf93e1611bc62e37fb8")
md5sums=('SKIP')
backup=('etc/repokeeper.conf')

package() {
    cd ${srcdir}/${pkgname}
    python3 setup.py -q install --root="$pkgdir"
    install -D -m0666 ${srcdir}/${pkgname}/repokeeper.conf ${pkgdir}/etc/repokeeper.conf
}
