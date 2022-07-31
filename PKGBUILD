Maintainer="baris-inandi"
pkgname=fe
pkgver=1.0.8
pkgrel=1
pkgdesc="AUR helper with a familiar subcommand system"
arch=(x86_64)
url="https://github.com/baris-inandi/fe"
license=('GPLv3')
depends=(bash sudo)
makedepends=(git go bash)
source=("git+$url")
md5sums=('SKIP')

package() {
	cd $pkgname
	sudo cp conf/paru.conf /etc/paru.conf
	sudo cp conf/pacman.conf /etc/fepacman.conf
	if ! type "paru" > /dev/null; then echo "WARN: INSTALL PARU BEFORE USING FE"; fi
	sudo rm -rf /usr/bin/fe
	sudo go build -o /usr/bin/fe
	sudo rm -rf fe
}
