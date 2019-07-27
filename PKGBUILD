# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=otf-gfs-neohellenic-math
pkgver=20190727
pkgrel=1
pkgdesc='An open type mathematical font from the Greek Font Society.'
arch=(any)
url='http://www.greekfontsociety-gfs.gr'
license=('custom: SIL-OFL')
makedepends=('unzip')
depends=()

source=("http://www.greekfontsociety-gfs.gr/_assets/fonts/GFS_NeoHellenic_Math.zip"
	"LICENSE")
noextract=(${source[@]##*/})
md5sums=('aac8f8ba1606c8a110bba93688495d04'
         '288069c8fb0c828b081833cfcfe0638b')

package() {
cd "$srcdir"
_xlist="__MACOSX/* .OFL-FAQ.txt OFL-FAQ.txt OFL.txt"
unzip GFS_NeoHellenic_Math.zip -x ${_xlist}

install -d $pkgdir/usr/share/fonts/$pkgname/
install -Dm644 $srcdir/GFS*/*otf $pkgdir/usr/share/fonts/$pkgname/
install -d $pkgdir/usr/share/licenses/$pkgname/
install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
