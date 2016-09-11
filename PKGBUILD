pkgname=titanim-mikalair-git
pkgver=2.1.0
pkgrel=1
pkgdesc="VK-based messenger"
arch=('i686' 'x86_64')
url="https://bitbucket.org/mikalair/titanim"
license=('GPL')
groups=('im')
depends=('qt5-base' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-multimedia' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-webengine' 'aseman-qt-tools-git')
source=("git+https://bitbucket.org/mikalair/titanim.git")
sha256sums=("SKIP")

build() {
	cd "$srcdir/titanim"
	qmake
	make

}

package() {
        cd "$srcdir/titanim"
        make DESTDIR="$pkgdir/" INSTALL_ROOT="$pkgdir/" install
	install -D -m644 "TitanIM.desktop" "$pkgdir/usr/share/applications/TitanIM.desktop"
	install -Dm644 "TitanIM64.png" "$pkgdir/usr/share/pixmaps/TitanIM64.png"
}