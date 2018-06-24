# Maintainer: Andrey Balandin <it dot dervish AT gmail dot com>

pkgname=pkgsizes
pkgver=0.1.1
pkgrel=1
pkgdesc="Python script that prints a table with actual sizes of packages"
arch=('any')
url="https://github.com/AndreyBalandin/archlinux-pkgsizes/"
license=('GPL3')
depends=('python')
source=("https://github.com/AndreyBalandin/archlinux-pkgsizes/raw/master/$pkgname.py")
md5sums=('SKIP')

pkgver() {
    cd $srcdir
    # extract version from script with pattern: $pkgname v(XX.YY.ZZ)
    sed -n "0,/.*$pkgname v\([0-9]\+.[0-9]\+.[0-9]\+\).*/s//\1/p" $pkgname.py
}

package() {
    install -D $pkgname.py "$pkgdir/usr/bin/$pkgname.py"
}
