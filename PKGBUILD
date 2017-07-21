# Maintainer: Hugo Osvaldo Barrera
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: feuri

pkgname=dunstify
_pkgname=dunst
pkgver=1.2.0
pkgrel=1
pkgdesc="notify-send replacement with dunst-specific extensions"
arch=('i686' 'x86_64')
url="http://www.knopwob.org/dunst/"
license=(BSD)
depends=(dunst)
makedepends=(libnotify)
source=("https://github.com/dunst-project/dunst/archive/v$pkgver.tar.gz")
md5sums=('425d5bb10a8b571c7494c5e60aaae7e1')

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
