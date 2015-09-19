# Maintainer: PhotonX <photon89 [at] gmail.com>.

pkgname=ezame-git
_realname=ezame
pkgver=0.6
pkgrel=2
pkgdesc="A Desktop file Editor - that eventually will be able to edit menu structures for interfaces that still use them"
arch=('i686' 'x86_64')
url="https://github.com/linux-man/ezame"
license=('GPL3')
depends=('python' 'python-xdg' 'python-gobject' 'desktop-file-utils')
makedepends=('git')
source=()
md5sums=()

_giturl=https://github.com/linux-man/ezame.git

build() {
	cd ${srcdir}
	msg "Connecting to the server...."
	if [ -d ${srcdir}/$_realname ]; then
		cd ${srcdir}/$_realname
		git pull
	else
		git clone $_giturl
	fi
}

package() {
	cd ${srcdir}/$_realname
	python setup.py install --root ${pkgdir}
} 
