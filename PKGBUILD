# Maintainer: Johannes Wienke <languitar@semipol.de>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: willemw <willemw12@gmail.com>
# Contributor: Anntoin Wilkinson <anntoin gmail com>

pkgname=python-i3-py
pkgver=0.6.7
# https://github.com/ziberna/i3-py/issues/22
_commit=27f88a616e9ecc340e7d041d3d00782f8a1964c1
pkgrel=5
pkgdesc="tools for i3 users and developers"
arch=('any')
url='https://github.com/ziberna/i3-py'
license=('GPL3' 'custom:WTFPL2')
depends=('python' 'i3-wm')
makedepends=('git' 'python' 'python2')
source=("$pkgname::git+https://github.com/ziberna/i3-py#commit=$_commit"
        'LICENSE::http://www.wtfpl.net/txt/copying/')
md5sums=('SKIP'
         '8365d07beeb5f39d87e846dca3ae7b64')

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 "$srcdir"/LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
    install -Dm644 examples/*.py -t "$pkgdir"/usr/share/"$pkgname"/examples
}

# vim: set et sw=4 sts=4 ft=sh:
