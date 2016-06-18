# Maintainer: Torin Cooper-Bennun <torin.cbennun@googlemail.com>

_pkgname='pacsize'
pkgname="$_pkgname-git"
pkgver='r2.70aab34'
pkgrel=1
pkgdesc='Utility that gets the installed size of pacman packages.'
arch=('any')
url='https://github.com/TorinCooperBennun/pacsize'
license=('GPL')
depends=('python' 'python-hurry-filesize')
makedepends=('git')
source=('git+https://github.com/TorinCooperBennun/pacsize.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    # mkdir -p "$pkgdir/usr/bin"
    # cp pacsize "$pkgdir/usr/bin/pacsize"
    install -D pacsize "$pkgdir/usr/bin/pacsize"
    # chmod +x "$pkgdir/usr/bin/pacsize"
}
