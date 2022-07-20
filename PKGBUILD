# Maintainer: Campbell Jones <dev at serebit dot com> 

pkgname=wraith-master-bin
pkgver=1.2.1
pkgrel=2
pkgdesc="A Wraith Prism RGB control application (Binary Version)"
arch=('x86_64')
url="https://gitlab.com/serebit/wraith-master"
license=("APACHE")
depends=('gtk3')
source=("wraith-master-v$pkgver.tar.xz"::"https://gitlab.com/serebit/wraith-master/uploads/e4bef291e3292c6e2c2d2b96841786c5/wraith-master-v1.2.1.tar.xz")
sha256sums=('d9ea771b9707e2576c18d18eba769096ce8fc929bb3d161aced90c56fbf4d117')

package(){
    cd "wraith-master-v$pkgver"

    install -d "$pkgdir/usr/bin"
    install -Dm755 wraith-master wraith-master-gtk "$pkgdir/usr/bin"

    install -d "$pkgdir/etc/udev/rules.d"
    install -Dm644 udev/*.rules "$pkgdir/etc/udev/rules.d"

    install -d "$pkgdir/usr/share/applications"
    install -Dm644 desktop/*.desktop "$pkgdir/usr/share/applications"

    install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 icons/*.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps"

    install -d "$pkgdir/usr/share/metainfo"
    install -Dm644 metainfo/*.metainfo.xml "$pkgdir/usr/share/metainfo"

    install -d "$pkgdir/usr/share/man/man1"
    install -Dm644 man/*.1 "$pkgdir/usr/share/man/man1"
}
