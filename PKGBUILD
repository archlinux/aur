# Maintainer: phiresky <phireskyde+git@gmail.com>
# Maintainer: TheTrueColonel <benjaminesims@gmail.com>
pkgname=qdirstat
pkgver=2.0
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
sha256sums=('a0b2ba91caf68ec4ee7705d5063bc542ac8aea4d421451103245c69d272bf19f')


build() {
	cd "$pkgname-$pkgver"
	qmake6
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
}
