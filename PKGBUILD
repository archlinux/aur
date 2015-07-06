# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Contributor: Ward De Ridder <aur[at]warddr.eu>
# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=kochmorse
_pkgname=KochMorse
pkgver=0.99.7
pkgrel=2
pkgdesc="A easy to use Morse Code trainer using the Koch-method."
arch=('any')
url="http://kochmorse.googlecode.com"
license=('GPL')
depends=('pygtk' 'python2-pyalsaaudio' 'desktop-file-utils')
install=$pkgname.install
source=($url/files/${_pkgname}-$pkgver.tar.gz)

prepare() {
	cd $srcdir/${_pkgname}-$pkgver/${_pkgname}

	sed -i 's:python:python2:' kochmorse.py
}

package() {
	cd $srcdir/${_pkgname}-$pkgver

	python2 setup.py install --root=$pkgdir || return 1
}
md5sums=('126a74c816b895984a1d8a3ab207aa86')
sha256sums=('47c43ffeb921ccf83727086b9c98c41a20bf286f3473ed77919d8511b54b0a44')
