# Maintainer: Talon <diablodev@googlegroups.com>
pkgname=diablo-project-manager
pkgver=1.6.1
pkgrel=1
pkgdesc="A Basic Project Manager"
arch=("x86_64")
url="https://gitlab.com/diablodev/dpm"
license=('MIT')
depends=('bash' 'git' 'glibc')
optdepends=('zenity: allows you to run dpm.gui')
makedepends=('shc')
provides=("diablo-project-manager")
conflicts=("diablo-project-manager-git")
source=("$url/-/archive/${pkgver}/dpm-${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$srcdir/dpm-1.6"
	make PACKAGE="$pkgname" PREFIX="/usr" build
}

package() {
	cd "$srcdir/dpm-1.6"
	make PACKAGE="$pkgname" DESTDIR="$pkgdir" PREFIX="/usr" install
}
