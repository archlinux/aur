# Maintainer: Victor Lavaud <victor.lavaud@gmail.com>
pkgname=sprog-fortune
pkgver=pkgversioning
pkgrel=1
pkgdesc="A fortune database made of /u/poem_for_your_sprog's comments in Reddit"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/qdii/sprog-fortune"
license=('GPL')
depends=()
makedepends=('git')
provides=('sprog-fortune')
conflicts=('sprog-fortune')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname"
    install -Dm444 sprog "$pkgdir/usr/share/fortune/sprog"
    install -Dm444 sprog.dat "$pkgdir/usr/share/fortune/sprog.dat"
}
