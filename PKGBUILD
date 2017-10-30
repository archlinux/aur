# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=clipmenu
pkgver=4.0.1
pkgrel=1
pkgdesc='Clipboard management using dmenu'
url='http://github.com/cdown/clipmenu'
arch=('any')
license=('ISC')
depends=(dmenu xsel)
conflicts=(clipmenu-git)  # Old package from pre-AUR4 days

source=("https://github.com/cdown/clipmenu/archive/${pkgver}.zip")
md5sums=('b56b7306afb01de0d04eb04241006fa5')

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
