#
# Maintainer: eiNjel <alekw3@gmail.com>
#

pkgname=easy-boot-creator
_pkgname=easy-boot-creator
pkgver=0.1
pkgrel=1
pkgdesc="Tool to create a bootable usb stick quick and easy"
url="https://einjel-frontend.herokuapp.com"

arch=('x86_64')
license=('GPL')

depends=('tar' 'coreutils' 'util-linux' 'parted' 'gksu' 'git')
optdepends=('ttf-dejavu')

options=('!libtool' '!emptydirs')

provides=('easy-boot-creator')
conflicts=('easy-boot-creator')

source=('git+https://bitbucket.org/eiNjel/easybootcreator.git')

sha256sums=('SKIP')

prepare() {
	cd "$srcdir"/
}

build() {
	cd "$srcdir"/
}

package() {
    cd "$srcdir"/

    install -Dm755 "$srcdir/easybootcreator/easy-boot-creator.sh" "$pkgdir/usr/bin/easy-boot-creator"
    install -Dm755 "$srcdir/easybootcreator/easy-boot-creator.1" "$pkgdir/usr/share/man/man1/easy-boot-creator.1"
    install -Dm755 "$srcdir/easybootcreator/ebc.tar.gz" "$pkgdir/opt/EBC/ebc.tar.gz"
    install -Dm755 "$srcdir/easybootcreator/ebc.desktop" "$pkgdir/usr/share/applications/ebc.desktop"
    cd "$pkgdir/opt/EBC/" && tar xvf ebc.tar.gz && rm ebc.tar.gz
    rm -r "$srcdir/easybootcreator/"
}
