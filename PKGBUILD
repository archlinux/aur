# Maintainer: Eloy Garcia Almaden <eloy.garcia.pca@gmail.com>
pkgname=buttermanager
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Graphical tool to create BTRFS snapshots, balance filesystems and upgrade the system safety"
arch=('x86_64')
url="https://github.com/egara/buttermanager"
license=('GPL')
groups=()
depends=('btrfs-progs' 'python>=3')
makedepends=('git' 'python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/egara/buttermanager#branch=master')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname"
        # Dependencies and package installation
	python setup.py install --user
}

package() {
	cd "$pkgname"
        # Creating destination directory
  	install -dm755 "$pkgdir/opt/$pkgname"

	# Copying all the structure to the destination directory
	cp -ar "$srcdir/$pkgname/$pkgname/" "$pkgdir/opt/$pkgname/"

  	# Copying .desktop file and icon
  	install -Dm644 "$srcdir/$pkgname/aur/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname/aur/$pkgname.svg" "$pkgdir/opt/$pkgname/gui/$pkgname.svg"
}
