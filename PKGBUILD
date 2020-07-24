# Maintainer: Michal Lisowski <lisu87@gmail.com>
pkgname=relevation
pkgver=1.3.1
pkgrel=2
pkgdesc="Command-line search for Revelation Password Manager files"
arch=('any')
url="http://p.outlyer.net/relevation/"
license=('custom')
depends=('python-crypto' 'python-lxml')
makedepends=('python2-setuptools')
source=("http://p.outlyer.net/relevation/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('40488551b95ce1fcfc6062e51efd8545')

prepare() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
