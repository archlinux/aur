# Maintainer: Dominik Heidler <dheidler@gmail.com>

pkgname=aurbs
pkgver=1.3.2
pkgrel=1
pkgdesc="AUR package build system"
arch=('any')
url="http://github.com/asdil12/aurbs"
license=('GPL')
groups=()
provides=()
install="aurbs.install"
depends=(
	'devtools' 'rsync' 'python'
	'python-setuptools' 'python-simplejson' 'python-yaml' 'python-pymongo' 'python-flask' 'pyalpm'
	'python-flup-hg'
)
backup=(
	'etc/aurbs.yml'
	'var/lib/aurbs/aurstaging/i686/aurstaging.db.tar.gz'
	'var/lib/aurbs/aurstaging/x86_64/aurstaging.db.tar.gz'
)

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/asdil12/$pkgname/tar.gz/$pkgver")
md5sums=('78495ee7e7b87c14a5ee98fdad8a48c2')

package() {
	cd $srcdir/$pkgname-$pkgver
	make install DESTDIR=$pkgdir
}
