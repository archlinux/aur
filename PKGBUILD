# Maintainer: Cody Regester <cody@llanet.tk>
pkgname=libki
pkgver=20.05
pkgrel=2
pkgdesc="The client package for libki. The libki server must be installed and running either on this or another machine."
arch=('any')
url="libki.org"
license=('GPL')
depends=()
makedepends=('git'  'qt5-base')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=(homes/$USER/.config/Libki.ini)
changelog=
source=("git+https://github.com/Libki/libki-client.git")
md5sums=('SKIP')

build() {
	cd "libki-client"
	qmake Libki.pro
	make
	cp example.ini ~/.config/Libki.ini
	sudo -s cp example.ini /etc/libki/Libki.ini
}

package() {
	cd 'libki-client'
	sudo -s cp libkiclient /usr/local/bin
	sudo -s chmod +x /usr/local/bin/libkiclient
}
