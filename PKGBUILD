# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Frank Fischer <frank-fischer@shadow-soft.de>
pkgname=sailautossh
_dirname=lyro-sailautossh-cba5f700dcef
pkgver=1.3.4
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
sha256sums=('f8bd11da5e6dcdbffd2a96b754c0dfd49765c92ced39d755a03963a99ed72201')

build() {
  cd "${srcdir}/$_dirname"
  qmake PREFIX=/usr CONFIG+=BUILD_DESKTOP sailautossh.pro
  make
}

package() {
	cd "${srcdir}/$_dirname"
	make INSTALL_ROOT="$pkgdir" install
}
