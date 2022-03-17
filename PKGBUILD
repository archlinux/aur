# Maintainer: demonkingswarn <demonkingswarn at protonmail dot com>
pkgname=demon-terminal
pkgrel=2
pkgver=0.1
pkgdesc="A simple minimalistic terminal written in C++."
arch=('any')
url="https://github.com/demonkingswarn/${pkgname}"
license=('MIT')
makedepends=('git' 'gcc')
source=(git+https://github.com/demonkingswarn/${pkgname})
sha256sums=('SKIP')

pkgver() {
    cd "$(_pkgname)"
	printf "0.1_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
	g++ $(pkg-config --cflags --libs Qt5Widgets qtermwidget5) -fPIC -o dt demon-term.cpp
	sudo cp dt /usr/local/bin/dt
	sudo cp dt.desktop /usr/local/share/applications/dt.desktop
}

