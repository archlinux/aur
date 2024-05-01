# Maintainer: AI5C <ai5c@ai5c.com>
# Contributor: Johannes Wienke <languitar@semipol.de>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: Anntoin Wilkinson <anntoin gmail com>

pkgname=python-i3-py
pkgver=0.6.8
# https://github.com/ziberna/i3-py/issues/22
_commit=27f88a616e9ecc340e7d041d3d00782f8a1964c1
pkgrel=10
pkgdesc="tools for i3 users and developers"
arch=('any')
url='https://github.com/ziberna/i3-py'
license=('GPL3')
depends=('python' 'i3-wm')
makedepends=('git' 'python')
optdepends=('python2: legacy')
source=("$pkgname::git+https://github.com/ziberna/i3-py#commit=$_commit")
md5sums=('SKIP')

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 examples/*.py -t "$pkgdir"/usr/share/"$pkgname"/examples
}

# vim: set et sw=4 sts=4 ft=sh:
