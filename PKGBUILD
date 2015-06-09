# maintainer: Lara Maia <lara@craft.net.br>

pkgname=backup-conf
pkgdesc='This script create a backup of your config files in a tree format on current folder'
url="https://github.com/LaraCraft93/$pkgname"
pkgver=4.4.2
pkgrel=1
license=('GPL')
arch=('any')
backup=('etc/backup-conf.conf')
install='backup-conf.install'

depends=('util-linux'
         'gettext'
         'colordiff'
         'sudo'
         )

optdepends=('git: for git management')

source=("https://github.com/LaraCraft93/$pkgname/archive/v$pkgver.tar.gz"
       "backup-conf.install")

md5sums=('a2ce85ae88f9a9bebad4e8936710a05d'
         'b452e0f879c2d25650330a37ed13f110')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

