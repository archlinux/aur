# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-search-providers-jetbrains
pkgver=1.2.1
pkgrel=2
pkgdesc="Add Jetbrains IDE projects to Gnome Search"
arch=('x86_64')
url="https://github.com/lunaryorn/gnome-search-providers-jetbrains"
license=('MPL2')
depends=('gnome-shell')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
md5sums=('f3f68476cfbd941d3cf3f2b4e39763f4')
sha1sums=('ecfc0e8792fb39109ab571831fb9bb4daeaa9de4')
sha512sums=('aa6b1fb8c75aec4ca2eedd682d98bfe5455279358219ee43ac423766a81d978509f28e012abeb65f18b64c22285fd3b8b391d48068742585dfe674ca5f56f006')

package() {
	cd "$pkgname-$pkgver"

	cargo build --release --locked
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
