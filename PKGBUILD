# Maintainer: João Figueiredo <jf dot mundox at gmail dot com> 

pkgname=python2-pyxattr
pkgver=0.6.1
pkgrel=1
pkgdesc="Filesystem extended attributes for python 2"
arch=('any')
url="https://pypi.org/project/pyxattr/$pkgver/"
license=('LGPL')
depends=('python2')
makedepends=('git')
source=("https://files.pythonhosted.org/packages/36/1d/1a5f3165f330e1a0427636f2bd995dbcc02d0f7660e89458d64806a2ed1e/pyxattr-$pkgver.tar.gz")
sha256sums=('b525843f6b51036198b3b87c4773a5093d6dec57d60c18a1f269dd7059aa16e3')

build() {
	cd "$srcdir/${pkgname#*-}-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/${pkgname#*-}-$pkgver"
	install -Dm755 build/lib.linux-x86_64-2.7/xattr.so "$pkgdir/usr/lib/python2.7/site-packages/xattr.so"
	install -d "$pkgdir/usr/lib/python2.7/site-packages/pyxattr-$pkgver-py2.7.egg-info/"
	install -Dm644 pyxattr.egg-info/* "$pkgdir/usr/lib/python2.7/site-packages/pyxattr-$pkgver-py2.7.egg-info/"
}
