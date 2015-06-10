# maintainer: Lara Maia <lara@craft.net.br>

pkgname=backup-conf
pkgdesc='This script create a backup of your config files in a tree format on current folder'
url="https://github.com/LaraCraft93/$pkgname"
pkgver=5.0
pkgrel=2
license=('GPL')
arch=('any')
install='backup-conf.install'

depends=('util-linux'
         'gettext'
         'sudo')

optdepends=('diffutils: the default diff tool'
            'colordiff: a colored diff tool'
            'git: for git management')

source=("https://github.com/LaraCraft93/$pkgname/archive/v$pkgver.tar.gz"
       "backup-conf.install")

md5sums=('728d69dde7fff0d6616230ca18c46e7a'
         'b452e0f879c2d25650330a37ed13f110')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

