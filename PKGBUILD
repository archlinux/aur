# Maintainer: DoTheEvolution <DoTheEvo@gmail.com>
pkgname="angrysearch"
pkgver=0.9.4
pkgrel=1
pkgdesc="Instant file search"
arch=("any")
url="https://github.com/dotheevo/angrysearch/"
license=("GPL")
depends=("python-pyqt5" "libxkbcommon-x11" "xdg-utils")
source=("https://github.com/DoTheEvo/ANGRYsearch/archive/v$pkgver.tar.gz")
sha256sums=("5336b4595ebbbab995fc3886c5fcd9c0c5a163f3215102e0a937f1480f0820b1")

package() {
 cd "ANGRYsearch-$pkgver"
 install -Dm755 angrysearch.py "$pkgdir/opt/angrysearch/angrysearch.py"
 install -Dm755 angrysearch_update_database.py "$pkgdir/opt/angrysearch/angrysearch_update_database.py"
 install -Dm644 angrysearch.desktop "$pkgdir/opt/angrysearch/angrysearch.desktop"
 install -Dm644 angrysearch.svg "$pkgdir/opt/angrysearch/angrysearch.svg"
 install -Dm644 scandir.py "$pkgdir/opt/angrysearch/scandir.py"
 install -Dm644 resource_file.py "$pkgdir/opt/angrysearch/resource_file.py"
 install -Dm644 qdarkstylesheet.qss "$pkgdir/opt/angrysearch/qdarkstylesheet.qss"

 install -d "$pkgdir/usr/bin"
 install -d "$pkgdir/usr/share/pixmaps"
 install -d "$pkgdir/usr/share/applications"

 ln -s "/opt/angrysearch/angrysearch.py" "$pkgdir/usr/bin/angrysearch"
 ln -s "/opt/angrysearch/angrysearch.svg" "$pkgdir/usr/share/pixmaps"
 ln -s "/opt/angrysearch/angrysearch.desktop" "$pkgdir/usr/share/applications"
}
