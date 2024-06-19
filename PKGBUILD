# maintainer: Lara Maia <lara@craft.net.br>

pkgname=backup-conf
pkgdesc='Create a backup of your config files in tree format on the current folder'
url="https://github.com/ShyPixie/$pkgname"
pkgver=5.2.2
pkgrel=1
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

sha256sums=('81ee7e9a5c0abc3a6e15876427a1b50c73afed9e472ad6514dd5efb62e23e0ac'
            'e014f65a320da2bc0f4578f8a6f58baf0df919b89a271ba1308d0fb3fa5273d9')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

