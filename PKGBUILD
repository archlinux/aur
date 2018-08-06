# Maintainer: Sherlock HOlo <sherlockya(at)gmail.com>

pkgname=system-storage-manager
_pkgver=1.0
pkgver=v$_pkgver
pkgrel=2
pkgdesc='A single tool to manage your storage'
arch=('i686' 'x86_64')
url='https://github.com/system-storage-manager/ssm'
license=('GPL2')
depends=('python' 'btrfs-progs' 'dmraid')
makedepends=('python-sphinx')
source=("$url/archive/system-storage-manager-$_pkgver.tar.gz")
sha256sums=('2c35e7192cb00e02f78c7beadde6f4bf8b1957ed5e238448517c542251b3f91f')

prepare() {
	cd $srcdir/ssm-$pkgname-$_pkgver/doc
	make man
	#sed -i 's/data_files/#data_files/g' setup.py
	#sed -i "s/ ('/#('/g" setup.py
	#sed -i "s/\['R/#\['R/g" setup.py
    cd ..
	#python setup.py build
}

package() {
    cd $srcdir/ssm-$pkgname-$_pkgver
    python setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
}
