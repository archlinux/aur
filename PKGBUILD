# Maintainer: phiresky <phireskyde+git@gmail.com>
# Maintainer: TheTrueColonel <benjaminesims@gmail.com>
pkgname=qdirstat
pkgver=2.0.1
pkgrel=1
pkgdesc="Qt-based directory statistics (KDirStat/K4DirStat without any KDE - from the original KDirStat author)"
arch=(i686 x86_64)
url="https://github.com/shundhammer/qdirstat"
license=('GPL-2.0-only')
depends=('qt6-base' 'qt6-5compat' 'glibc' 'gcc-libs' 'zlib' 'hicolor-icon-theme')
makedepends=('git')
optdepends=(
	"perl: For use with scripts"
	"perl-uri: For use with scripts"
)
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/shundhammer/qdirstat/archive/$pkgver.tar.gz")
sha256sums=('5d7e3dd5ed7db7d8aa9090c50ee48e699666277196a4d90ad39000de4538a5bf')

build() {
	cd "$pkgname-$pkgver"
	qmake6
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
