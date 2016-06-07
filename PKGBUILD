# Maintainer: Brandon Milton <brandon.milton21@gmail.com>
pkgname=download-sweeper
pkgver=1.0
pkgrel=6
pkgdesc="A stale file archive and removal tool"
arch=('any')
url="https://github.com/brandonio21/download-sweeper"
license=('GPL')
depends=('python>=3' 'systemd' 'python-virtualenv')
makedepends=('python-pip')
source=("https://github.com/brandonio21/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('e54f13dc3d220295b1cd6ff17834dcfc')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
