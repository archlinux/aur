# maintainer: Lara Maia <dev@lara.monster>

pkgname=backup-conf
pkgdesc='Create a backup of your config files in tree format on the current folder'
url="https://github.com/calendulish/$pkgname"
pkgver=5.2.3
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

source=("https://github.com/calendulish/$pkgname/archive/v$pkgver.tar.gz"
       "backup-conf.install")

sha256sums=('11d1b8785b663a741e91e3ed831a3700dff49c95ab1589963a6404c469e09639'
            'e014f65a320da2bc0f4578f8a6f58baf0df919b89a271ba1308d0fb3fa5273d9')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

