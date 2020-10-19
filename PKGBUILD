# Maintainer: Tibor Bamhor <tiborb95 at gmail dot com>
pkgbase=repokeeper
pkgname=repokeeper
pkgver=0.3.2
pkgrel=1
pkgdesc="Local AUR packages repository keeper and updater"
arch=('any')
url="https://github.com/tibor95/repokeeper"
license=('GPL3')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/tibor95/repokeeper.git#commit=dfbd511f2e10ac2b1620aa4360bbc59b46bcbe7b")
md5sums=('SKIP')
backup=('etc/repokeeper.conf')

package() {
    cd ${srcdir}/${pkgname}
    python3 setup.py -q install --root="$pkgdir"
    install -D -m0666 ${srcdir}/${pkgname}/repokeeper.conf ${pkgdir}/etc/repokeeper.conf
}
