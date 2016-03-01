# Maintainer: c0mm0ner <projekt@w3b0.de>

pkgname=ewsgateway
pkgver=1.0.1
pkgrel=1
pkgdesc="EWS Gateway allows you to access the Embedded Web Server (EWS) on several models of HP printers via USB under Linux."
url="https://github.com/c0mm0ner/ewsgateway"
arch=('any')
license=('BSD')
depends=('python2' 'tk' 'python2-pyusb')
optdepends=('sudo: runtime privilege escalation'
	    'kdesudo: runtime privilege escalation'
	    'gksu: runtime privilege escalation'
	    'kdesu: runtime privilege escalation')

source=("https://github.com/c0mm0ner/ewsgateway/archive/v1.0.1.tar.gz")
md5sums=('0848ad12589943294e0acbdca30b2b21')

build() {
	cd $srcdir/$pkgname-$pkgver/
	mv $pkgname.py $pkgname
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  install -m755 -D $pkgname $pkgdir/usr/bin/$pkgname
  install -m644 -D COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README $pkgdir/usr/share/doc/$pkgname/README
}
