# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=python-broadcast-logging-git
pkgver=r1.fcc54bb
pkgrel=1
pkgdesc="A Python logging system handler which broadcasts log messages and a matching receiver executable."
arch=(any)
url="https://github.com/languitar/broadcast-logging"
license=('LGPL3')
depends=('python3')
makedepends=('git' 'python-setuptools')
source=("${pkgname}::git://github.com/languitar/broadcast-logging.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    python3 setup.py install --root="$pkgdir/"
}
