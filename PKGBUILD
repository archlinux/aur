# Maintainer: robertfoster

pkgname=gr-lida-git
pkgver=468.30c338b
pkgrel=1
pkgdesc="Frontend for DosBox, ScummVM and VDMSound"
arch=('i686' 'x86_64')
url="http://www.gr-lida.org/"
license=('GPL2')
depends=('qt5-base' 'poppler-qt5' 'phonon-qt5')
optdepends=('dosbox: Enable support for dosbox emulator'
'scummvm: Enable support for scummvm emulator')
makedepends=('git')
source=('gr-lida::git+https://github.com/Monthy/gr-lida.git')

build() {
	cd gr-lida
	qmake gr-lida.pro
}

package(){
	cd gr-lida
	make INSTALL_ROOT=${pkgdir} install
}

pkgver() {
	cd gr-lida
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
