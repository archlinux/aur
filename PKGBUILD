# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=nickvision-money
_pkgname=NickvisionMoney
pkgver=2022.11.1
pkgrel=1
pkgdesc="A personal finance manager"
arch=('x86_64')
url=https://github.com/nlogozzo/$_pkgname
license=('GPL3')
depends=('jsoncpp' 'libadwaita' 'sqlitecpp')
makedepends=('boost' 'cmake' 'meson')
source=($url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('6c128b481cb6ff61a389777adec91f9331afda1dd649c0617dc7185adf67da51')

build() {
	arch-meson $_pkgname-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
