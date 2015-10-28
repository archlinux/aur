# Maintainer: Michal Lisowski <lisu87@gmail.com>
pkgname=relevation
pkgver=1.3
pkgrel=1
pkgdesc="Command-line search for Revelation Password Manager files"
arch=('any')
url="http://p.outlyer.net/relevation/"
license=('custom')
depends=('python2-crypto' 'python2-lxml')
makedepends=('python2-setuptools')
source=("http://p.outlyer.net/relevation/files/${pkgname}-${pkgver}.tar.gz"
        "$pkgname-python2.patch")
md5sums=('4b5ec6152c7c6a26f4aa3e1f157ef4e3'
         'a020e1a4f8aeb056f2335224ed3ee3c7')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-python2.patch"
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
