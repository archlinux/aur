# Maintainer: Ellis Kenyo <elken at member dot fsf dot org>
pkgname=projectascension-dev-git
pkgver=0
pkgrel=1
pkgdesc="Community-driven open source gaming client"
arch=('any')
url="http://www.projectascension.io"
license=('MIT')
depends=('cmake' 'boost' 'ninja' 'qt5-base' 'qt5-declarative' 'qt5-webkit')
makedepends=('git') 
install=
source=('projectascension::git+https://www.github.com/Proj-Ascension/Client#branch=dev')
md5sums=('SKIP')

# pkgver() {
# 	cd "$srcdir/${pkgname%-dev-git}"
# 	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
# }

build() {
	cd "$srcdir/${pkgname%-dev-git}"
        cmake . -G "Ninja"
        ninja
}

package() {
	cd "$srcdir/${pkgname%-dev-git}"
        install -Dm755 ProjectAscension ${pkgdir}//usr/bin
}
