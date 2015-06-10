# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=gpdfx
pkgver=1.1
pkgrel=7
pkgdesc="A graphical tool to extract parts of a PDF as a PDF"
arch=('any')
url="http://www.lhnr.de/ext/gpdfx/index.php"
license=("GPL")
depends=("python2" "texlive-core" "python2-poppler")
makedepends=()
source=(http://www.lhnr.de/ext/gpdfx/$pkgname-$pkgver.tar.gz) 
md5sums=("baf61782b83e1c2189331821a856bdbd")

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	#python 2
	sed -i -e "s|#!/usr/bin/env python$|#!/usr/bin/env python2|" gpdfx
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm 755 gpdfx "$pkgdir"/usr/bin/gpdfx
	install -Dm 755 clipdfx "$pkgdir"/usr/bin/clipdfx
}

