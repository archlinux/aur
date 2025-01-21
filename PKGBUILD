# Maintainer: Kef Schecter <furrykef@gmail.com>
# Contributor: dest_demo
# Contributor: dobo <dobo90_at_gmail.com>

pkgname=igcc
pkgver=0.2
pkgrel=2
pkgdesc='Interactive GCC real-eval-print loop for C and C++ programmers'
arch=('any')
url='http://www.artificialworlds.net/wiki/IGCC/IGCC'
license=('GPL-2.0-or-later')
depends=('python2')
source=("https://codeberg.org/andybalaam/igcc/archive/igcc-$pkgver.tar.gz"
        'setup.py')
b2sums=('90009b5924030a9f103666246deebaf947d3683eaecc4187221446c123dcddc429b8d63b867522033037ff2212a088e8003882d76a5490f28d01bbf7c252bf43'
        '6202dca5ee86177463d5438c99532ae528f5b3944fa637822be91ad1539fad2205d3ce4fd8f24c2593fee803ed927620a9a3af6558df834fa4185a879929b5be')

prepare() {
    cd "$srcdir/$pkgname"

    # Change shebang line to use python2
    sed -i 's@#!/usr/bin/python@#!/usr/bin/python2@' igcc
}

package() {
    cd "$srcdir/$pkgname"
    python2 ../setup.py install --prefix=/usr --root="$pkgdir"
}

