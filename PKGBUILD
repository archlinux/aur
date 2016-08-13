# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Patrick Eigensatz <patrick.eigensatz@gmail.com>

pkgname=qjournalctl
pkgver=0.2
pkgrel=1
pkgdesc="Qt-based graphical user interface for systemd's journalctl command"
arch=('i686' 'x86_64')
url="https://github.com/pentix/qjournalctl/"
license=('GPL')
depends=('qt5-base')
makedepends=('gcc-libs-multilib')
source=('https://github.com/pentix/qjournalctl/archive/v0.2.tar.gz')
md5sums=('debd87fb60d50c4bd01bec99cff80a40')
sha256sums=('ba29cbde9df05538fc4c81f649e40d3754a3d852ab6c064b78898d0f5cafaa7a')

build() {
	cd qjournalctl-0.2
	sh autogen.sh
	make -j9
}

package() {
	mkdir -p $pkgdir/usr/bin/
	cp qjournalctl-0.2/qjournalctl $pkgdir/usr/bin/
}
