# Maintainer: Talon Wettstein <diablodev@googlegroups.com>
pkgname=diablo-project-manager
pkgver=1.2
pkgrel=1
pkgdesc="A CLI Project Manager"
arch=("x86_64")
url="https://gitlab.com/diablodev/dpm"
license=('MIT')
depends=('bash' 'git' 'glibc')
makedepends=('shc')
provides=("diablo-project-manager")
conflicts=("diablo-project-manager-git")
source=("https://gitlab.com/diablodev/dpm/-/raw/main/VERSION" "https://gitlab.com/diablodev/dpm-bin/-/raw/main/dpm-bin.zip")
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cat VERSION | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	PREFIX="$pkgdir/usr" ./install "$pkgname"
}
