# Maintainer: aksr <aksr at t-com dot me>
pkgname=fig2pstricks
pkgver=0.7.2
pkgrel=2
pkgdesc='A fig-to-pstricks converter.'
arch=(any)
url='http://econ.korea.ac.kr/~chirokhan/fig2pstricks'
license=('GPL-2.0')
optdepends=('xfig' 'texlive-pstricks')
source=("$url/$pkgname-$pkgver.tar.gz")
md5sums=('cd01b5a758018340f1339a55147d7e91')
sha1sums=('1fd78e8fa1fe7a38a61545c8514f03fb96c37c36')
sha256sums=('a4f266c6a648114dea9d6a4d9299a1a66dbb95b78da0557c7973eefdf30d4515')
b2sums=('e151c1c5efe1b235a931e738990a328447f972c7c0365d15b527af22f282c55917e81292f8d93bdb2603e989a1a8033838eb9f3b15d436dbc7c6750f1f93e0ff')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m755 fig2pstricks $pkgdir/usr/bin/fig2pstricks
	install -D -m755 fig2epspdf $pkgdir/usr/bin/fig2epspdf
	install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
}
