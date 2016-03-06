pkgname=spectator-git
pkgver=v0.6.r45.gbe39a5b
pkgrel=1
pkgdesc="Desktop application to monitor router Turris"
arch=('i686' 'x86_64')
url="https://gitlab.labs.nic.cz/turris/spectator"
license=('GPL3')
depends=('qt5-base' 'qt5-translations')
makedepends=('git' 'sudo')
install=$pkgname.install
source=("$pkgname"::'git+https://gitlab.labs.nic.cz/turris/spectator.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    QT_SELECT=5 qmake
    sudo make 
}

package() {
    cd "$srcdir/$pkgname"
    make install
}
