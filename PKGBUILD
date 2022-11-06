# Contributor: Yamada Hayao <hayao@fascode.net>
# Maintainer: Matrix <thysupremematrix a_t tuta d_o_t io>

_extname='desktop-icons-ng'
pkgname="gnome-shell-extension-desktop-icons-ng"
pkgver="47"
pkgrel=3
pkgdesc="A fork from the official desktop icons project, with several enhancements like Drag'n'Drop."
arch=('x86_64' 'i686')
url="https://gitlab.com/rastersoft/desktop-icons-ng/"
license=('GPL3')
depends=('gnome-shell>=3.38')
makedepends=('git' 'meson' 'glib2')
conflicts=("$pkgname-git")
source=("$_extname-$pkgver.tar.gz::https://gitlab.com/rastersoft/$_extname/-/archive/$pkgver/$_extname-$pkgver.tar.gz")
install="gnome-shell-extension.install"
sha512sums=('a52131e89b54a7d7400bb0269403dbee7e5173347863721f8191a0e3b6fde7bdc3f83ee8bd71b132191e170566e237704645bb71ef3cd748a350ab60f09deb33')

build() {
  arch-meson desktop-icons-ng-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
