# Maintainer: Justin Vreeland <vreeland.justin@gmail.com>
pkgname=debmake
pkgver=4.2.1
pkgrel=1
pkgdesc="Program to make the Debian source package"
arch=('any')
url="http://packages.debian.org/sid/debmake"
license=('MIT')
makedepends=('git' 'python')
depends=('devscripts' 'dpkg' 'python' 'rsync')
optdepends=('strace' 'wget' 'curl')
source=("$pkgname"::'git+https://anonscm.debian.org/git/collab-maint/debmake.git')
md5sums=('SKIP')

package() {
	cd $srcdir/"$pkgname"
	git checkout debian/$pkgver-$pkgrel

	python setup.py install --root="$pkgdir/" --optimize=1
}
