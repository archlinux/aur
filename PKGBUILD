# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Author: ody

pkgname=pacman-cage
pkgver=2.9.9
pkgrel=7
pkgdesc="Creates a loopbacked filesystem to give better response times when using pacman"
arch=(any)
url=http://bbs.archlinux.org/viewtopic.php?id=20385
license=(GPL3)
install=$pkgname.install
source=($pkgname
    pacman-uncage
    pacmandb.service)
sha256sums=('b8fdedfa25e88298b4560c425ffe529e43b2aea52bd1eec8e48134aae614403a'
    'b48e68d72ecb8636c2e1f35ee83e829210d7132630354b9d40ed1d8a2b50c1a6'
    '861f7569cc4c5c21d0415cfd44187bc464ae80e2202c4981c1fd7e19fbca9d72')
sha512sums=('b3ddb573767eb15308a45e56d6527c2fd66a3ef4414c73eea82ea1d5bc720de6fc8873d46a38bd853a44edc0d601f7e4278d9e931fed82d7171b37358b11a07c'
    '26dbaecd342ea2cc7a0edeacd6bd777524a0be96a85c81b254256f3a15da6e92d88da8a2a7b388168bc4010e3a7be6a52493c50ac8ac1d0ad97b0246348551b3'
    '0c78094aa69abfb5d409a1ee98f4241ddfc6cf7c73b1ccae01df21b37b72970d6ad424d1bb983ae77992b13608b8adee10b3f689b3fd037d3f0638c5d9806d11')

package() {
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm755 pacman-uncage "$pkgdir"/usr/bin/pacman-uncage
    install -Dm644 pacmandb.service "$pkgdir"/usr/lib/systemd/system/pacmandb.service
}
