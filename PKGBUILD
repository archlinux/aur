# Maintainer: Hugo Osvaldo Barrera
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: feuri

pkgname=dunstify
_pkgname=dunst
pkgver=1.1.0
pkgrel=1
pkgdesc="Customizable and lightweight notification-daemon"
arch=('i686' 'x86_64')
url="http://www.knopwob.org/dunst/"
license=(BSD)
depends=(dunst)
makedepends=(libnotify)
source=("http://www.knopwob.org/public/dunst-release/$_pkgname-$pkgver.tar.bz2")
md5sums=('7c37fb5306012fd658839908479dbbed')

build() {
  make -C "$srcdir/$_pkgname-$pkgver" X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11 dunstify
}

package() {
  install -Dm 755 "${srcdir}/$_pkgname-$pkgver/dunstify" \
    "${pkgdir}/usr/bin/dunstify"
  install -Dm 644 "${srcdir}/$_pkgname-$pkgver/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
