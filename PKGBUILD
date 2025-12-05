# Maintainer: Roshless <pkg@roshless.com>

pkgname=ttea
pkgrel=1
pkgver=1.3.1
pkgdesc="CLI tea manager"
url="https://git.roshless.me/roshless/ttea"
arch=('x86_64' 'i686')
license=("GPL")
source=("https://git.roshless.me/roshless/$pkgname/archive/$pkgver.tar.gz")
makedepends=('meson')
depends=('glibc')
optdepends=(
    'mpv: play timer sound'
    'mplayer: alternative player for timer'
    'gtk4: alternative GTK gui'
)

build() {
	arch-meson $pkgname build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}

sha512sums=('b6f268bfbefdc5d2c5be0fb83784129e89feeba2ff5fc5e5630434ee2f37a9bc40aef8d19325522e80a99530018dcf0c30cf8cf0f9caa0d18392ac992118c8b4')
