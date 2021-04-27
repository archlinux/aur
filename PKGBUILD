# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=todobg
pkgver=0.1.1
pkgrel=2
pkgdesc='Todo list on the X root window'
url="http://github.com/cdown/$pkgname"
arch=('any')
license=('Public Domain')
depends=(inotify-tools imagemagick xorg-xrandr)

source=("https://github.com/cdown/${pkgname}/archive/refs/tags/${pkgver}.zip")
md5sums=('bc7f2a8be86b985dca72d31d1a2ce3f0')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/todobg" \
        "${pkgdir?}/usr/bin/todobg"
    install -D -m644 \
        "${srcdir?}/$pkgname-$pkgver/todobg.service" \
        "${pkgdir?}/usr/lib/systemd/user/todobg.service"
    install -D -m644 \
        "${srcdir?}/$pkgname-$pkgver/todobg-recreate.service" \
        "${pkgdir?}/usr/lib/systemd/user/todobg-recreate.service"
    install -D -m644 \
        "${srcdir?}/$pkgname-$pkgver/todobg-recreate.timer" \
        "${pkgdir?}/usr/lib/systemd/user/todobg-recreate.timer"
}
