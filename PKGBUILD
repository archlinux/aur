Maintainer="baris-inandi"
pkgname=fe
pkgver=1.0.8
pkgrel=1
pkgdesc="AUR helper with a familiar subcommand system"
arch=(x86_64)
url="https://github.com/baris-inandi/fe"
license=('GPL3')
depends=(bash sudo paru)
makedepends=(git go)
source=("git+$url")
md5sums=('SKIP')
backup=(/etc/fepacman.conf /etc/paru.conf)

package() {
	cd $pkgname
	cp conf/paru.conf /etc/paru.conf
	cp conf/pacman.conf /etc/fepacman.conf
	sudo rm -rf /usr/bin/fe
	sudo go build -o /usr/bin/fe
	sudo rm -rf fe
}
