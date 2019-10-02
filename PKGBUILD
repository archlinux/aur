# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Frank Fischer <frank-fischer@shadow-soft.de>
pkgname=sailautossh
pkgver=1.3.6
pkgrel=1
pkgdesc="Automatic SSH Tunneling tool"
arch=('i686' 'x86_64')
url="http://chiselapp.com/user/fifr/repository/sailautossh"
license=('GPL3')
depends=(qt5-base hicolor-icon-theme)
makedepends=(mercurial)
provides=('sailautossh')
install=$pkgname.install
_dirname="sailautossh-$pkgver"
source=("https://chiselapp.com/user/fifr/repository/sailautossh/tarball/v$pkgver/sailautossh-$pkgver.tar.gz")
sha256sums=('4ecf5be3ec436af85d8df3b1475c25133119122640c616f412ab7141a78c3da3')

build() {
  cd "${srcdir}/$_dirname"
  qmake PREFIX=/usr CONFIG+=BUILD_DESKTOP sailautossh.pro
  make
}

package() {
	cd "${srcdir}/$_dirname"
	make INSTALL_ROOT="$pkgdir" install
}
