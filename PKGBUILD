# Maintainer: phiresky <phireskyde+git@gmail.com>
# Maintainer: TheTrueColonel <benjaminesims@gmail.com>
pkgname=qdirstat
pkgver=1.9
pkgrel=1
pkgdesc="Qt-based directory statistics (KDirStat/K4DirStat without any KDE - from the original KDirStat author)"
arch=(i686 x86_64)
url="https://github.com/shundhammer/qdirstat"
license=('GPL-2.0-only')
groups=()
depends=('qt5-base' 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=qdirstat.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/shundhammer/qdirstat/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('5a9abda2dbdca3d012d1d9ce7a601abf89e2af77d677f1e5d613f53fb7ad19ff')


build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
