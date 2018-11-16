# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Frank Fischer <frank-fischer@shadow-soft.de>
pkgname=sailautossh
_dirname=lyro-sailautossh-db101a93d7a1
pkgver=1.3.3
pkgrel=1
pkgdesc="Automatic SSH Tunneling tool"
arch=('i686' 'x86_64')
url="http://bitbucket.org/lyro/sailautossh"
license=('GPL3')
depends=(qt5-base hicolor-icon-theme)
makedepends=(mercurial)
provides=('sailautossh')
install=$pkgname.install
source=("https://bitbucket.org/lyro/$pkgname/get/v$pkgver.tar.bz2")
sha256sums=('cd2b63537941e1bef98f54f07e677bb3e2a9b6cedf844ba09a4dec3a3ff0e970')

build() {
  cd "${srcdir}/$_dirname"
  qmake PREFIX=/usr CONFIG+=BUILD_DESKTOP sailautossh.pro
  make
}

package() {
	cd "${srcdir}/$_dirname"
	make INSTALL_ROOT="$pkgdir" install
}
