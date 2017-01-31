# Maintainer: Anna Ivanova <kalterfx@gmail.com>

pkgname='mkpackage-git'
pkgver='5.fbe2fd1'
url='https://github.com/kalterfive/mkpackage'
pkgrel='1'
pkgdesc='Collect an Arch package using its information from a local pacman database'
arch=('any')
license=('GPL3')
depends=('bash')
source=("mkpackage::git://github.com/kalterfive/mkpackage")
md5sums=('SKIP')

conflicts=('mkpackage')
provides=('mkpackage')

function pkgver()
{
	cd 'mkpackage'
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

function package()
{
	cd 'mkpackage/script'
	DESTDIR="$pkgdir" ./install.sh
}

