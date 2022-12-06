
# Maintainer: SpamixOfficial <spamixofficial@gmail.com>
pkgname=hashzam-git
pkgver=1.0
pkgrel=1
pkgdesc="A simple command line tool written in python that calculate and compare hashes!"
arch=(x86_64)
url="https://github.com/SpamixOfficial/hashzam-git-aur.git"
license=('GPL-3.0')
depends=()
makedepends=(git python-pip python)
optdepends=()
provides=(hashzam)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	sudo echo "sudo enabled"
	pip install colorama
}

package() {
	cd hashzam-git-aur
	sudo mkdir "/usr/share/licenses/${pkgname}"
	sudo mkdir "/usr/share/doc/${pkgname}"
	chmod +x hashzam.py 
	sudo cp hashzam.py "/usr/local/bin/hashzam"
	sudo cp LICENSE "/usr/share/licenses/${pkgname}/LICENSE"
	sudo cp README.md "/usr/share/doc/${pkgname}/README.md"
}
