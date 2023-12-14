pkgname=filerunner
pkgver=23.03.07.16
pkgrel=1
pkgdesc='Tk-based two-panel file manager'
url='https://wiki.tcl-lang.org/page/FileRunner'
license=(GPL3)
arch=(any)
depends=(tk)
source=(https://sourceforge.net/projects/filerunner/files/release-$pkgver/fr-$pkgver.tar.gz)
sha256sums=('79cf8196a2dd9913059937494301d30be674deb6cdf00303816f8bb828625ebf')

package() {
	cd $pkgname/Makefiles

	DESTDIR="$pkgdir" ./INSTALL -verbose

	if [[ $CARCH == @(i686|x86_64|armv6l) ]]; then
		ln -vnsf "$CARCH/libinotify1.4.1.so" "$pkgdir/usr/share/filerunner/packages/inotify/"
	fi
}
