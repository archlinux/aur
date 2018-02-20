# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=clipmenu
pkgver=5.0.0
pkgrel=1
pkgdesc='Clipboard management using dmenu'
url='http://github.com/cdown/clipmenu'
arch=('any')
license=('Public Domain')
depends=(dmenu xsel clipnotify)
conflicts=(clipmenu-git)  # Old package from pre-AUR4 days

source=("https://github.com/cdown/clipmenu/archive/${pkgver}.zip")
md5sums=('40e6a6b10f1a284815b2f74e32045022')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/clipmenu" \
        "${pkgdir?}/usr/bin/clipmenu"
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/clipmenud" \
        "${pkgdir?}/usr/bin/clipmenud"
    install -D -m644 \
        "${srcdir?}/$pkgname-$pkgver/init/clipmenud.service" \
        "${pkgdir?}/usr/lib/systemd/user/clipmenud.service"
}
