# Maintainer: DoTheEvolution <DoTheEvo@gmail.com>
pkgname="angrysearch"
pkgver=0.9.3
pkgrel=1
pkgdesc="Instant file search"
arch=("any")
url="https://github.com/dotheevo/angrysearch/"
license=("GPL")
depends=("python-pyqt5" "libxkbcommon-x11" "xdg-utils")
source=("https://github.com/DoTheEvo/ANGRYsearch/archive/v$pkgver.tar.gz")
md5sums=("929102eededf7edfe3615cd64ea7985d")

package() {
 cd "ANGRYsearch-$pkgver"
 install -Dm755 angrysearch.py "$pkgdir/opt/angrysearch/angrysearch.py"
 install -Dm755 scandir.py "$pkgdir/opt/angrysearch/scandir.py"
 install -Dm644 angrysearch.desktop "$pkgdir/opt/angrysearch/angrysearch.desktop"

 touch "$pkgdir/opt/angrysearch/angry_database.db"

 cp -rf icons "$pkgdir/opt/angrysearch"

 install -d "$pkgdir/usr/bin"
 install -d "$pkgdir/usr/share/pixmaps"
 install -d "$pkgdir/usr/share/applications"

 ln -s "/opt/angrysearch/angrysearch.py" "$pkgdir/usr/bin/angrysearch"
 ln -s "/opt/angrysearch/icons/angrysearch.svg" "$pkgdir/usr/share/pixmaps"
 ln -s "/opt/angrysearch/angrysearch.desktop" "$pkgdir/usr/share/applications"
}
