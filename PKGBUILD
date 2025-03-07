# Maintainer: Dimitri Gigot <dimgigot@gmail.com>
pkgname=oscar-launcher-git
pkgver=0.1.0
pkgrel=1
pkgdesc="One Simple Configurable Action Runner"
arch=(x86_64)
url="https://github.com/dimitri-gigot/oscar"
license=('MIT')
depends=(gjs gtk4)
makedepends=(git)
provides=(oscar)
conflicts=(oscar oscar-git oscar-bin)

source=("git+https://github.com/dimitri-gigot/oscar")
md5sums=('SKIP')

package() {
	cd "oscar"
	# Install the binary src/oscar into /usr/bin/oscar
	install -Dm755 src/oscar "$pkgdir/usr/bin/oscar"

	# copy files from .config/oscar/* to /etc/oscar/*
	install -d "$pkgdir/etc/oscar"
	echo $srcdir
    cp -r "$srcdir/oscar/.config/oscar/." "$pkgdir/etc/oscar/"

}