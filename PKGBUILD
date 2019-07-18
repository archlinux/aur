# Maintainer: Daniel Mulford <dgmulf@gmail.com>
pkgname=wavdumper
pkgver=0.5
pkgrel=1
pkgdesc="Print detailed information on the headers and structure of a WAV file."
arch=('any')
url="https://www.cs.helsinki.fi/u/hkovaska/wavdumper/"
license=('GPL2')
depends=('python2')
source=("https://www.cs.helsinki.fi/u/hkovaska/wavdumper/wavdumper-0.5.tar.gz"
        "$pkgname-$pkgver.patch")
md5sums=('c5a079bc68c7bdd205fc5bb69b380176'
         '054bbb824051eef16a529fa4ed13fd86')

prepare() {
	cd "$pkgname-$pkgver"
	patch -i "$srcdir/$pkgname-$pkgver.patch"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 wavdumper.py "$pkgdir/usr/bin/wavdumper"
	install -Dm644 readme.html "$pkgdir/usr/share/doc/$pkgname/readme.html"
}
