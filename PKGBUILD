# Maintainer: sTiKyt <stikyt@protonmail.com>
pkgname=draquet-polyglot-bin
pkgver=3.3
pkgrel=1

pkgdesc="PolyGlot is a conlang construction toolkit."
arch=('x86_64')
url="http://draquet.github.io/PolyGlot/index.html"
license=('MIT')
depends=('alsa-lib' 'freetype2' 'glibc' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib')
makedepends=('git' 'xz' 'tar')
provides=('draquet-polyglot')
install=
source=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/DraqueT/PolyGlot/releases/download/${pkgver}/PolyGlot-Ins-Lin.deb")
md5sums=('24ebc0a74fc8d4f429fed9cd2a61904e')
prepare() {
	cd "$srcdir"
        tar -xf data.tar.xz
}

package() {
	install -Dm755 $srcdir/opt/polyglot-linear-a/bin/PolyGlot "$pkgdir/usr/bin/PolyGlot"
        install -Dm644 $srcdir/opt/polyglot-linear-a/share/doc/copyright "$pkgdir/usr/share/doc/copyright"
        mkdir -p "$pkgdir/usr/lib/"
        cp -r $srcdir/opt/polyglot-linear-a/lib/* "$pkgdir/usr/lib/"
}
