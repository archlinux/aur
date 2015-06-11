# Maintainer: Your Name <youremail@domain.com>
pkgname=nemo-qml-plugin-dbus-git
pkgver=2.0.r77.0427a3b
pkgrel=1
pkgdesc="The Nemo Mobile D-Bus QML Plugin allows you to access services on the system and session bus, as well as provide your own services."
arch=('i686' 'x86_64' 'arm')
url="https://github.com/nemomobile/nemo-qml-plugin-dbus"
license=('LGPL2')
groups=()
depends=('qt5-base' 'qt5-declarative')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("$pkgname"::'git+https://github.com/nemomobile/nemo-qml-plugin-dbus.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "2.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	qmake src
	make
}

package() {
	cd "$srcdir/${pkgname}"
	make INSTALL_ROOT="$pkgdir/" install
}
