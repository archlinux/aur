# Maintainer: Andrey Bobkov <medvedx64 at gmail dot com>

pkgname=wapkg
pkgver=0.4.1
pkgrel=1
pkgdesc="Worms Armageddon package manager & download utility"
arch=('any')
url="https://github.com/MEDVEDx64/wapkg"
license=('Apache')
depends=('python')
optdepends=('wine: required by launcher functionality to work')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('c3bbe58950ea4d27a0de415feb057d3b08afae60bbecff0b143de6fda95a299d')

package() {
	cd "$pkgname-$pkgver"
	py_dst=usr/lib/wapkg
	mkdir -p $pkgdir/$py_dst

	cp *.py $pkgdir/$py_dst/
	cp -r wapkg $pkgdir/$py_dst/

	mkdir -p $pkgdir/usr/bin
	cd $pkgdir/usr/bin
	ln -s /$py_dst/wapt.py wapt
	ln -s /$py_dst/warun.py warun
	ln -s /$py_dst/wqdaemon.py wqdaemon
}
