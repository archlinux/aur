# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: feuri

pkgname=dunstify
_pkgname=dunst
pkgver=1.3.2
pkgrel=1
pkgdesc="notify-send replacement with dunst-specific extensions"
arch=('i686' 'x86_64')
url="http://www.knopwob.org/dunst/"
license=(BSD)
depends=(dunst)
makedepends=(libnotify)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/dunst-project/dunst/archive/v$pkgver.tar.gz")
md5sums=('68ad9fd1dab537d7a1ad93c899c50278')

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
