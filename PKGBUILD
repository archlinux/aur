# Maintainer: Savvy Raghuvanshi <sraghuvanshi at college dot harvard dot edu>

pkgname=harvard-linux-printer
pkgver=15.30afe11
pkgrel=1
pkgdesc="Connect to Harvard University's printer network from an Arch Linux machine." 
arch=('any')
url="https://github.com/djsavvy/harvard-linux-printer"
license=('MIT')
depends=('cups' 'samba' 'smbclient' 'bash') 
makedepends=('git' 'coreutils')
optdepends=('gtk3-print-backends:	to print from GTK3 applications')
source=("git://github.com/djsavvy/harvard-linux-printer#branch=aur-package")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)" | sed -e 's/-/_/g'
}


package() {
	cd "$pkgname"
	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
