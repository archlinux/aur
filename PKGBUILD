# Maintainer: phiresky <phireskyde+git@gmail.com>
pkgname=qdirstat
pkgver=1.8
pkgrel=1
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
sha256sums=('5dc6f6229657d101abd5448f7c4d754ff823aa5e2816e3835574e7f808cea4f8')


build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
