# Maintainer: phiresky <phireskyde+git@gmail.com>
pkgname=qdirstat
pkgver=1.5
pkgrel=2
pkgdesc="Qt-based directory statistics (KDirStat/K4DirStat without any KDE - from the original KDirStat author)"
arch=(i686 x86_64)
url="https://github.com/shundhammer/qdirstat"
license=('GPL2')
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
sha256sums=('5de21fb1ccc9f4df29b2969aa652237b4430e2cfbe37f6eda088482ed44bdbf5')


build() {
	cd "$pkgname-$pkgver"
	qmake
	make -j$(nproc)
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
