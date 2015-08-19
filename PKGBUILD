# Maintainer: 3ED_0 <krzysztof1987 @ gmail.com>

pkgname=disksearch
pkgver=1.2.1
pkgrel=1
pkgdesc="is a tool for searching for files on removable media disks (e.g. for songs on your MP3-CD's)"
arch=('any')
url="http://www.saring.de/disksearch/"
license=('GPL')
depends=('python2' 'pygtk')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        "10-Makefile_small_tweakfix.patch"
        "11-disksearch_bin_script_paths_fix.patch")
noextract=()
sha256sums=('58711b617382582ad59d9d3ccf95d9a6eb9b620237455b4e586a6efa387258d7'
            '3d698b3eb7c18af4f9f045fb23246569608bcab8d2567c87629f693120a9e71b'
            'c611e37f5804f35cc26f2a14ec34fe630c0e26d6735e649ac57e54bb45fb76cb')
prepare() {
  cd "$pkgname-$pkgver"
  patch -Np0 -i "$srcdir/10-Makefile_small_tweakfix.patch"
  patch -Np0 -i "$srcdir/11-disksearch_bin_script_paths_fix.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
