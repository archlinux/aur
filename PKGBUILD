# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tarek Galal <tare2.galal@gmail.com>
pkgname=inception-android
pkgver=0.9.11
pkgrel=1
pkgdesc="Hands-off auto-configuration tools for android devices"
arch=('any')
url="https://github.com/tgalal/inception"
license=('GPL3')
depends=('python2' 'python2-argparse' 'python2-dulwich' 'android-dumpkey' 'cpio')
makedepends=('python2-setuptools' 'gcc')
optdepends=('jre8-openjdk-headless: signing packages')
source=("https://github.com/tgalal/inception/archive/$pkgver.tar.gz")
md5sums=('54ef7cf0cc3c41263b0daee149348d05')


build() {
	cd $srcdir/inception-$pkgver
	python2 setup.py build
}

package() {
	cd $srcdir/inception-$pkgver
	python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1
}
