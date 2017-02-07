# Author: rr- <rr-@sakuya.pl>
# Maintainer: rr- <rr-@sakuya.pl>
pkgname=termi-git
pkgver=0.1
pkgrel=1
pkgdesc='Images in your terminal, using ANSI and Unicode.'
arch=('any')
url='https://github.com/rr-/termi'
license=('MIT')
depends=('python' 'python-pip' 'git')
source=("$pkgname::git://github.com/rr-/termi.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --abbrev=0
}

build() {
    cd "$pkgname"
    python3 setup.py build
}

package() {
    cd "$pkgname"
    python3 setup.py install --prefix=/usr --root="$pkgdir"
}
