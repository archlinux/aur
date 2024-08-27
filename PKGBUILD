# Maintainer: Mazen Omar <wildlifemain1@gmail.com>

pkgname='mostaqem'
pkgver=1.0.0
pkgrel=1
pkgdesc="An Islamic app"
arch=("x86_64")
url="https://github.com/Mostaqem/mostaqem_desktop"
license=('GNU-V3')
depends=("mpv")
source=("https://github.com/Mostaqem/mostaqem_desktop/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('44b928d87011f628a0555b7d94bdafa6449efe6a0f633662c303e5b5661d1448')

build() {
	cd "$srcdir/mostaqem_desktop-$pkgver"
	flutter build linux --release
}

package() {
	cd "$srcdir/mostaqem_desktop-$pkgver"
  	install -Dm755 "build/linux/x64/release/bundle/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
