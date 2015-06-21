# Maintainer: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
pkgname=spreads
pkgver=0.5git20150527.c802
pkgrel=1
epoch=
pkgdesc="Modular workflow assistant for book digitization"
arch=('any')
url="https://github.com/DIYBookScanner/spreads"
license=('AGPL3')
depends=('python2'
         'python2-pip'
         'libffi'
         'libjpeg-turbo'
         'python2-cffi'
         'lua52'
         'python2-lupa'
         'gphoto2'
         'python2-flask'
         'python2-requests'
         'python2-tornado'
         'python2-wand'
         'python2-pyside')
source=("http://buildbot.diybookscanner.org/nightly/$pkgname-$pkgver.tar.gz")
sha512sums=('fcb66af0583c990467e308515e330ce0ff8a5732eea18cf33c127fcdf502e171f1e734028dce9272d6b31fd00876cff2227f026268dfd37ee6606b934c7ee1c1')

build() {
	cd "$pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
