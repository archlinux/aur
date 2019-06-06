# Maintainer: schw0reismus <schw0reismus@protonmail.com>

pkgname=foliate
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple and modern GTK eBook reader"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://johnfactotum.github.io/foliate/"
license=('GPL-3.0')
depends=('gjs' 'webkit2gtk' 'libsoup')
makedepends=('meson' 'ninja')
source=(https://github.com/johnfactotum/${pkgname}/archive/${pkgver}.tar.gz)
provides=("$pkgname")
conflicts=("$pkgname-git")
md5sums=('a5f3d0db5cef39f7c0f21991dd28f84e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	meson build --prefix=/usr
	ninja -C build
}

package(){
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
}
