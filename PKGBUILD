# maintainer: Lara Maia <lara@craft.net.br>

pkgname=backup-conf
pkgdesc='This script create a backup of your config files in a tree format on current folder'
url="https://github.com/ShyPixie/$pkgname"
pkgver=5.2.1
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

source=("https://github.com/ShyPixie/$pkgname/archive/v$pkgver.tar.gz"
       "backup-conf.install")

sha256sums=('c95b20650210c0c5e30fb0c08a17c8147af2484c2f016d6d353f967f599d4261'
            '851c6ba4ecbabb25111b0b0e0389117eb287ca134abe52489bff1e66eb2f9551')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

