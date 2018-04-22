# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=clipmenu
pkgver=5.3.0
pkgrel=1
pkgdesc='Clipboard management using dmenu'
url='http://github.com/cdown/clipmenu'
arch=('any')
license=('Public Domain')
depends=(dmenu xsel clipnotify)
conflicts=(clipmenu-git)  # Old package from pre-AUR4 days

source=("https://github.com/cdown/clipmenu/archive/${pkgver}.zip")
md5sums=('2b8ee30c10fe6053d1aab5f1451a4697')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/clipmenu" \
        "${pkgdir?}/usr/bin/clipmenu"
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/clipmenud" \
        "${pkgdir?}/usr/bin/clipmenud"
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/clipdel" \
        "${pkgdir?}/usr/bin/clipdel"
    install -D -m644 \
        "${srcdir?}/$pkgname-$pkgver/init/clipmenud.service" \
        "${pkgdir?}/usr/lib/systemd/user/clipmenud.service"
}
