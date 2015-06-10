# maintainer: Lara Maia <lara@craft.net.br>

pkgname=backup-conf
pkgdesc='This script create a backup of your config files in a tree format on current folder'
url="https://github.com/LaraCraft93/$pkgname"
pkgver=5.0
pkgrel=1
license=('GPL')
arch=('any')
install='backup-conf.install'

depends=('util-linux'
         'gettext'
         'colordiff'
         'sudo'
         )

optdepends=('git: for git management')

source=("https://github.com/LaraCraft93/$pkgname/archive/v$pkgver.tar.gz"
       "backup-conf.install")

md5sums=('a07297fd7ff46481d9e6cd7c4de6704c'
         'b452e0f879c2d25650330a37ed13f110')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

