# Maintainer: Konstantin Unruh <freaxmate@protonmail.com>
pkgname=pop-metacity-theme
pkgver=5.3.1
pkgrel=1
pkgdesc="System76 Pop Metacity Theme"
arch=('any')
url="https://github.com/FreaxMATE/$pkgname"
license=('GPL3')
makedepends=('meson')
optdepends=('pop-gtk-theme: for Pop GTK Theme'
            'pop-icon-theme: for Pop Icon Theme')

source=("$pkgname-$pkgver.tar.gz::https://github.com/FreaxMATE/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('a9026aa0811697e33c235ba48341f62734d730f4f705c8ed866449bf689774f37c84d3596aed5a81691fec4165397caa46171cebdd69b54c4faf9549c19fac75')

build() {
  cd "$pkgname-$pkgver"
  meson --prefix=/usr build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja install -C build
}

