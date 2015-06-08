# Maintainer: Jakob H. (nasenatmer at posteo dot de)
# adapted from Alexander Preisinger (maintainer of kbd-neo AUR package)

pkgname=kbd-bone
pkgver=1
pkgrel=2
pkgdesc="bone terminal keyboard layout"
arch=('any')
url="https://wiki.neo-layout.org/wiki/Bone"
license=('CC-BY-SA')
depends=('kbd')
install=$pkgname.install
source=(http://home.arcor.de/hellwoofa/bone.map)
md5sums=('4bce50a9b30dd4e1296aee1784bd7c0c')

build() {
    cd $srcdir
    gzip -f bone.map
}

package() {
    cd $srcdir
    install -m 664 -D bone.map.gz $pkgdir/usr/share/kbd/keymaps/i386/qwertz/bone.map.gz
}
