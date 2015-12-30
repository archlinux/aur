# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=gg-git
pkgver=20151219
pkgrel=1
pkgdesc="Git Goodies: At-A-Glance, Efficient, and Aesthetically Pleasing Git Shortcuts"
arch=("any")
url="https://github.com/qw3rtman/gg"
license=('Unkown')
depends=('bash')
makedepends=('git')
provides=('gg')
conflicts=('gg')
source=("$pkgname"::'git://github.com/qw3rtman/gg.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "bin/gg" "$pkgdir/usr/bin/gg"
}
